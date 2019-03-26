## ------------------------------------------------------------------------
library(mudata2)
ns_climate %>% tbl_data()

## ---- include=FALSE------------------------------------------------------
# this is to avoid depending on tidyverse
library(tidyr)
library(dplyr)
data("pocmaj")
data("pocmajsum")

## ---- eval = FALSE-------------------------------------------------------
#  library(tidyverse)
#  data("pocmaj")
#  data("pocmajsum")

## ------------------------------------------------------------------------
pocmajwide <- pocmajsum %>%
  select(core, depth, Ca, V, Ti)

## ---- echo=FALSE---------------------------------------------------------
knitr::kable(pocmajwide, row.names = FALSE, digits = 0)

## ------------------------------------------------------------------------
pocmajwide <- pocmajwide %>%
  rename(location = core)

## ------------------------------------------------------------------------
pocmajlong <- pocmajwide %>%
  gather(Ca, Ti, V, key = "param", value = "value")

## ---- echo=FALSE---------------------------------------------------------
knitr::kable(head(pocmajlong), row.names = FALSE, digits=0)

## ------------------------------------------------------------------------
md <- mudata(pocmajlong)
md

## ---- results='hide'-----------------------------------------------------
pocmajsum

## ---- echo=FALSE---------------------------------------------------------
knitr::kable(pocmajsum, row.names = FALSE, digits = 0)

## ------------------------------------------------------------------------
pocmajwide <- pocmajsum %>%
  rename(location = core)

## ------------------------------------------------------------------------
pocmajlong <- parallel_gather(pocmajwide, key = "param",
                              value = c(Ca, Ti, V), 
                              sd = c(Ca_sd, Ti_sd, V_sd))

## ---- echo=FALSE---------------------------------------------------------
knitr::kable(head(pocmajlong), row.names = FALSE, digits=0)

## ---- warning=FALSE------------------------------------------------------
md <- mudata(pocmajlong)
md

## ------------------------------------------------------------------------
# default parameter table
md %>%
  tbl_params()

# parameter table with metadata
md %>%
  update_params(method = "Portable XRF Spectrometer (Olympus X-50)") %>%
  tbl_params()

## ------------------------------------------------------------------------
# default location table
md %>%
  tbl_locations()

# location table with metadata
md %>%
  update_locations("MAJ-1", latitude = -64.298, longitude = 44.819,
                   lake = "Lake Major") %>%
  update_locations("POC-2", latitude = -65.985, longitude = 44.913,
                   lake = "Pockwock Lake") %>%
  tbl_locations()

## ------------------------------------------------------------------------
# default datasets table
md %>%
  tbl_datasets()

# datasets table with metadata
md %>%
  update_datasets(source = "R package mudata2, version 1.0.0") %>%
  tbl_datasets()

## ------------------------------------------------------------------------
md_doc <- md %>%
  update_params(method = "Portable XRF Spectrometer (Olympus X-50)") %>%
  update_locations("MAJ-1", latitude = -63.486, longitude = 44.732,
                   lake = "Lake Major") %>%
  update_locations("POC-2", latitude = -63.839, longitude = 44.794,
                   lake = "Pockwock Lake") %>%
  update_datasets(source = "R package mudata2, version 1.0.0")

## ------------------------------------------------------------------------
md_doc <- md_doc %>%
  update_columns_table()

## ------------------------------------------------------------------------
# default columns table
md_doc %>%
  tbl_columns()

# columns with metadata 
md_doc %>%
  update_columns("depth", description = "Depth in sediment core (cm)") %>%
  update_columns("sd", description = "Standard deviation uncertainty of n=3 values") %>%
  tbl_columns() %>%
  select(dataset, table, column, description, type)

## ------------------------------------------------------------------------
md_doc <- md %>%
  update_params(method = "Portable XRF Spectrometer (Olympus X-50)") %>%
  update_locations("MAJ-1", latitude = -63.486, longitude = 44.732,
                   lake = "Lake Major") %>%
  update_locations("POC-2", latitude = -63.839, longitude = 44.794,
                   lake = "Pockwock Lake") %>%
  update_datasets(source = "R package mudata2, version 1.0.0") %>%
  update_columns_table() %>%
  update_columns("depth", description = "Depth in sediment core (cm)") %>%
  update_columns("sd", description = "Standard deviation uncertainty of n=3 values")

## ---- eval = FALSE-------------------------------------------------------
#  # write to directory
#  write_mudata(poc_maj, "poc_maj.mudata")
#  # write to ZIP
#  write_mudata(poc_maj, "poc_maj.mudata.zip")
#  # write to JSON
#  write_mudata(poc_maj, "poc_maj.mudata.json")

## ---- eval = FALSE-------------------------------------------------------
#  # read from directory
#  read_mudata("poc_maj.mudata")
#  # read from ZIP
#  read_mudata("poc_maj.mudata.zip")
#  # read from JSON
#  read_mudata("poc_maj.mudata.json")

