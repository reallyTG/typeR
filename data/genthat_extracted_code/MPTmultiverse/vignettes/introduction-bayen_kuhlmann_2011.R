## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE
  , comment = "#>"
  , warning = FALSE
  , message = FALSE
  , fig.width = 8
)

## ----update-packages, eval = FALSE---------------------------------------
#  install.packages("MPTmultiverse")
#  update.packages(ask = FALSE)

## ----model-and-data, fig.height=5----------------------------------------
# load packages
library("MPTmultiverse")

# If you're running the analysis from an .rmd file, you only need to ensure that
# the .rmd, .eqn, and .csv files are all in the same directory.

# ------------------------------------------------------------------------------
# MPT model definition & data

EQN_FILE <- system.file("extdata", "2HTSM_Submodel4.eqn", package = "MPTmultiverse")
DATA_FILE <- system.file("extdata", "Kuhlmann_dl7.csv", package = "MPTmultiverse")

# if .csv format uses semicolons ";" (German format):
data <- read.csv2(DATA_FILE, fileEncoding = "UTF-8-BOM")  ## use correct encoding if necessary

# if .csv format uses commata "," (international format):
# data <- read.csv(DATA_FILE, fileEncoding = "UTF-8-BOM")

# We first take a look at the data using head()
head(data)

## We then plot the response frequencies using plotFreq from the TreeBUGS package
TreeBUGS::plotFreq(data, boxplot = FALSE, eqn = EQN_FILE)

## ------------------------------------------------------------------------
COL_ID <- "Subject"         # name of the variable encoding subject ID
COL_CONDITION <- "ExpCond"  # name of the variable encoding group membership


# Experimental conditions should be labeled in a meaningful way. To accomplish
# this, you may want to use the `factor` function:
unique(data[, COL_CONDITION])

data[[COL_CONDITION]] <- factor(
  data[[COL_CONDITION]]
  , levels = c(1:2)
  , labels = c("no_load", "load")
)

### check input data frame
head(data)

## ----options, results = 'hide'-------------------------------------------
# How to change a single option:
mpt_options(n.iter = 1e3)

# For testing purposes, you can use this shorthand to set fast, but unreliable options:
mpt_options("test")

# List all options that were set for the different analysis approaches:
mpt_options()

## ----analysis, results = 'hide', eval = FALSE----------------------------
#  set.seed(42)
#  mpt_options("default")
#  
#  results <- fit_mpt(
#    model = EQN_FILE
#    , dataset = DATA_FILE
#    , data = data
#    , id = COL_ID
#    , condition = COL_CONDITION
#    , core = c("D", "d")
#  )

## ---- eval=FALSE---------------------------------------------------------
#  save(results, file = paste0(EQN_FILE, "-", DATA_FILE, ".RData"))

## ---- eval=FALSE---------------------------------------------------------
#  save(results, file = "results_bayen_kuhlmann_2HTSM4.RData")

## ---- eval=FALSE---------------------------------------------------------
#  save(results, file = "fits/results_bayen_kuhlmann_2HTSM4.RData")

## ----echo = FALSE, eval = FALSE------------------------------------------
#  save(results, file = "../inst/extdata/results_bayen_kuhlmann.RData")

## ----echo = FALSE--------------------------------------------------------
load(file = system.file("extdata", "results_bayen_kuhlmann.RData", package = "MPTmultiverse"))

## ------------------------------------------------------------------------
check_results(results)

## ------------------------------------------------------------------------
library("dplyr")
library("tidyr")
glimpse(results)

## ------------------------------------------------------------------------
results %>% 
  select(pooling:method, test_between) %>% 
  unnest() %>% 
  filter(parameter == "g") %>% 
  print(width = 150)

## ------------------------------------------------------------------------
plot(results, save = FALSE, "est")

## ------------------------------------------------------------------------
plot(results, save = FALSE, "test_between")

## ------------------------------------------------------------------------
plot(results, save = FALSE, "gof1")

## ------------------------------------------------------------------------
plot(results, save = FALSE, "gof2")

