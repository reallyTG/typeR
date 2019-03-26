## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE-------------------------------------------------------
#  install.packages("bioset")

## ---- eval = FALSE-------------------------------------------------------
#  # install.packages("githubinstall")
#  gh_install_packages("bioset", ref = "vX.Y.Z-pre.N")

## ---- eval = FALSE-------------------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("randomchars42/bioset")

## ---- echo = FALSE-------------------------------------------------------
data <-
  utils::read.csv(
    system.file("extdata", "values.csv", package = "bioset"),
    header = FALSE)
rownames(data) <- LETTERS[1:4]

knitr::kable(
  data,
  row.names = TRUE,
  col.names = as.character(1:6))

## ---- eval = FALSE-------------------------------------------------------
#  library("bioset")

## ---- eval = FALSE-------------------------------------------------------
#  set_read()

## ---- echo = FALSE-------------------------------------------------------
data <- bioset::set_read(
  file_name = "values.csv",
  path = system.file("extdata", package = "bioset")
)
knitr::kable(data)

## ---- echo = FALSE-------------------------------------------------------
data <-
  utils::read.csv(
    system.file("extdata", "names.csv", package = "bioset"),
    header = FALSE)
rownames(data) <- LETTERS[1:4]

knitr::kable(
  data,
  row.names = TRUE,
  col.names = as.character(1:6))

## ---- echo = FALSE-------------------------------------------------------
data <-
  utils::read.csv(
    system.file("extdata", "values_names.csv", package = "bioset"),
    header = FALSE)
rownames(data) <- LETTERS[1:8]

knitr::kable(
  data,
  row.names = TRUE,
  col.names = as.character(1:6))

## ---- eval = FALSE-------------------------------------------------------
#  set_read(
#    additional_vars = c("name")
#  )

## ---- echo = FALSE-------------------------------------------------------
data <- bioset::set_read(
  file_name = "values_names.csv",
  path = system.file("extdata", package = "bioset"),
  additional_vars = c("name")
)
knitr::kable(data)

## ---- echo = FALSE-------------------------------------------------------
data <-
  utils::read.csv(
    system.file("extdata", "values_names_properties.csv", package = "bioset"),
    header = FALSE)
rownames(data) <- LETTERS[1:8]

knitr::kable(
  data,
  row.names = TRUE,
  col.names = as.character(1:6))

## ---- eval = FALSE-------------------------------------------------------
#  set_read(
#    additional_vars = c("name", "day")
#  )

## ---- echo = FALSE-------------------------------------------------------
data <- bioset::set_read(
  file_name = "values_names_properties.csv",
  path = system.file("extdata", package = "bioset"),
  additional_vars = c("name", "day")
)

knitr::kable(data)

## ---- eval = FALSE-------------------------------------------------------
#  set_calc_concentrations(
#    data,
#    cal_names = c("CAL1", "CAL2", "CAL3", "CAL4"),
#    cal_values = c(1, 2, 3, 4) # ng / ml
#  )

## ---- echo = FALSE-------------------------------------------------------
data <- bioset::set_calc_concentrations(
  data,
  cal_names = c("CAL1", "CAL2", "CAL3", "CAL4"),
  cal_values = c(1, 2, 3, 4) # ng / ml
)

knitr::kable(data)

## ---- eval = FALSE-------------------------------------------------------
#  data <- set_calc_variability(
#    data = data,
#    ids = sample_id,
#    value,
#    conc
#  )

## ---- echo = FALSE-------------------------------------------------------
data <- bioset::set_calc_variability(
  data = data,
  ids = sample_id,
  value,
  conc
)

knitr::kable(data)

## ---- eval = FALSE-------------------------------------------------------
#  # now you may run it :)
#  result_list <- sets_read(
#    sets = 1,
#    sep = ",",
#    additional_vars = c("name", "day"),
#    cal_names = c("CAL1", "CAL2", "CAL3", "CAL4"),
#    cal_values = c(1, 2, 3, 4) # ng / ml
#  )

## ---- echo = FALSE-------------------------------------------------------
result_list <- bioset::sets_read(
  sets = 1,
  sep = ",",
  path = system.file("extdata", package = "bioset"),
  additional_vars = c("name", "day"),
  cal_names = c("CAL1", "CAL2", "CAL3", "CAL4"),
  cal_values = c(1, 2, 3, 4), # ng / ml
  write_data = FALSE
)

## ---- eval = FALSE-------------------------------------------------------
#  result_list$all

## ---- echo = FALSE-------------------------------------------------------
knitr::kable(result_list$all)

## ---- eval = FALSE-------------------------------------------------------
#  result_list$samples

## ---- echo = FALSE-------------------------------------------------------
knitr::kable(result_list$samples)

## ---- eval = FALSE, warnings = FALSE-------------------------------------
#  result_list$set1$plot

