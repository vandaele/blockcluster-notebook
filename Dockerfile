FROM jupyter/r-notebook:612aa5710bf9

RUN echo 'options(repos = c(REPO_NAME = "https://packagemanager.rstudio.com/all/latest"))' > .Rprofile

COPY install.R .
RUN Rscript install.R

COPY . ${HOME}/work
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}