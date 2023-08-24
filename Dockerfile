# Start from a core stack version
FROM jupyter/datascience-notebook

USER ${NB_UID}

# Install from requirements.txt file
COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/
RUN pip install --quiet --no-cache-dir --requirement /tmp/requirements.txt && \
	jupyter contrib nbextension install --sys-prefix &&\
	jupyter nbextension enable scratchpad/main --sys-prefix &&\
	fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"