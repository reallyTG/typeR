## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(sdStaf)

# We read current distribution of Peruvian Plantcutter
current_list <- list.files(path=paste(system.file(package="sdStaf"),
                                      '/pre', sep=''), pattern='asc', full.names=TRUE)

current <- raster::stack(current_list)

# We read future distribution of Peruvian Plantcutter
future_list <- list.files(path=paste(system.file(package="sdStaf"),
                                     '/fut', sep=''), pattern='asc', full.names=TRUE)

future <- raster::stack(future_list)


## ------------------------------------------------------------------------
stabSpecies <- stability(current = current, project = future, thr.value=0.34)

## ------------------------------------------------------------------------
print(stabSpecies)


