## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message = FALSE----------------------------------------------------
library(ipumsr)
library(dplyr)

# To run the full vignette you'll also need the following packages:
installed_biglm <- requireNamespace("biglm")
installed_db_pkgs <- requireNamespace("DBI") & 
  requireNamespace("RSQLite") & 
  requireNamespace("dbplyr")

# Change these filepaths to the filepaths of your downloaded extract
cps_ddi_file <- "cps_00001.xml"
cps_data_file <- "cps_00001.dat"

## ---- echo = FALSE-------------------------------------------------------
# If files doesn't exist, check if ipumsexamples is installed
if (!file.exists(cps_ddi_file) | !file.exists(cps_data_file)) {
  ipumsexamples_ddi <- system.file("extdata", "cps_00011.xml", package = "ipumsexamples")
  ipumsexamples_data <- system.file("extdata", "cps_00011.dat.gz", package = "ipumsexamples")
  if (file.exists(ipumsexamples_ddi)) cps_ddi_file <- ipumsexamples_ddi
  if (file.exists(ipumsexamples_data)) cps_data_file <- ipumsexamples_data
}

# But if they still don't exist, give an error message
if (!file.exists(cps_ddi_file) | !file.exists(cps_data_file)) {
  message(paste0(
    "Could not find CPS data and so could not run vignette.\n\n",
    "If you tried to download the data following the instructions above, please make" , 
    "sure that the filenames are correct: ", 
    "\nddi - ", cps_ddi_file, "\ndata - ", cps_data_file, "\nAnd that you are in ",
    "the correct directory if you are using a relative path:\nCurrent directory - ", 
    getwd(), "\n\n",
    "The data is also available on github. You can install it using the following ",
    "commands: \n",
    "  if (!require(devtools)) install.packages('devtools')\n",
    "  devtools::install_github('mnpopcenter/ipumsr/ipumsexamples')\n",
    "After installation, the data should be available for this vignette.\n\n"
  ))
  
  installed_biglm <- FALSE
  installed_db_pkgs <- FALSE
  
  knitr::opts_chunk$set(eval = FALSE)
}

## ------------------------------------------------------------------------
read_ipums_micro(
  cps_ddi_file, data_file = cps_data_file, verbose = FALSE
) %>%
  mutate(
    HEALTH = as_factor(HEALTH),
    AT_WORK = EMPSTAT %>% 
      lbl_relabel(
        lbl(1, "Yes") ~ .lbl == "At work", 
        lbl(0, "No") ~ .lbl != "At work"
      ) %>% 
      as_factor()
  ) %>%
  group_by(HEALTH, AT_WORK) %>%
  summarize(n = n())

## ------------------------------------------------------------------------
cb_function <- function(x, pos) {
  x %>% mutate(
    HEALTH = as_factor(HEALTH),
    AT_WORK = EMPSTAT %>% 
      lbl_relabel(
        lbl(1, "Yes") ~ .lbl == "At work", 
        lbl(0, "No") ~ .lbl != "At work"
      ) %>% 
      as_factor()
  ) %>%
    group_by(HEALTH, AT_WORK) %>%
    summarize(n = n())
}

## ------------------------------------------------------------------------
cb <- IpumsDataFrameCallback$new(cb_function)

## ------------------------------------------------------------------------
chunked_tabulations <- read_ipums_micro_chunked(
  cps_ddi_file, data_file = cps_data_file, verbose = FALSE,
  callback = cb, chunk_size = 1000
)

## ------------------------------------------------------------------------
chunked_tabulations %>%
  group_by(HEALTH, AT_WORK) %>% 
  summarize(n = sum(n))

## ------------------------------------------------------------------------
# Read in data
data <- read_ipums_micro(
  cps_ddi_file, data_file = cps_data_file, verbose = FALSE
)

# Prepare data for model
# (age has been capped at 99, which we assume is high enough to not
#  cause any problems so we leave it.)
data <- data %>%
   mutate(
      HEALTH = as_factor(HEALTH),
      AHRSWORKT = lbl_na_if(AHRSWORKT, ~.lbl == "NIU (Not in universe)"),
      AT_WORK = EMPSTAT %>% 
        lbl_relabel(
          lbl(1, "Yes") ~ .lbl == "At work", 
          lbl(0, "No") ~ .lbl != "At work"
        ) %>% 
        as_factor()
    ) %>%
    filter(AT_WORK == "Yes")

# Run regression
model <- lm(AHRSWORKT ~ AGE + I(AGE^2) + HEALTH, data)
summary(model)

## ---- eval = installed_biglm---------------------------------------------
biglm_cb <- IpumsBiglmCallback$new(
  model = AHRSWORKT ~ AGE + I(AGE^2) + HEALTH,
  prep = function(x, pos) {
    x %>% 
      mutate(
        HEALTH = as_factor(HEALTH),
        AHRSWORKT = lbl_na_if(AHRSWORKT, ~.lbl == "NIU (Not in universe)"),
        AT_WORK = EMPSTAT %>% 
          lbl_relabel(
            lbl(1, "Yes") ~ .lbl == "At work", 
            lbl(0, "No") ~ .lbl != "At work"
          ) %>% 
          as_factor()
      ) %>%
      filter(AT_WORK == "Yes")
  }
)

## ---- eval = installed_biglm---------------------------------------------
chunked_model <- read_ipums_micro_chunked(
  cps_ddi_file, data_file = cps_data_file, verbose = FALSE,
  callback = biglm_cb, chunk_size = 1000
)

summary(chunked_model)

## ------------------------------------------------------------------------
# Subset only those in "Poor" health
chunked_subset <- read_ipums_micro_chunked(
  cps_ddi_file, data_file = cps_data_file, verbose = FALSE,
  callback = IpumsDataFrameCallback$new(function(x, pos) {
    filter(x, HEALTH == 5)
  }), 
  chunk_size = 1000
)

## ---- eval = installed_db_pkgs-------------------------------------------
# Connect to database
library(DBI)
library(RSQLite)
con <- dbConnect(SQLite(), path = ":memory:")

# Add data to tables in chunks
ddi <- read_ipums_ddi(cps_ddi_file)
read_ipums_micro_chunked(
  ddi,
  data_file = cps_data_file,
  readr::SideEffectChunkCallback$new(function(x, pos) {
    if (pos == 1) {
      dbWriteTable(con, "cps", x)
    } else {
      dbWriteTable(con, "cps", x, row.names = FALSE, append = TRUE)
    }
  }),
  chunk_size = 1000,
  verbose = FALSE
)


## ---- eval = installed_db_pkgs-------------------------------------------
example <- tbl(con, "cps")

example %>%
  filter('AGE' > 25)

## ---- eval = installed_db_pkgs-------------------------------------------
example %>%
  filter('AGE' > 25) %>%
  ipums_collect(ddi)

