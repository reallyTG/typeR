## ---- include = FALSE----------------------------------------------------
is_check <- ("CheckExEnv" %in% search()) || any(c("_R_CHECK_TIMINGS_",
             "_R_CHECK_LICENSE_") %in% names(Sys.getenv()))
knitr::opts_chunk$set(eval = !is_check)

## ------------------------------------------------------------------------
Sys.sleep(100)

## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
    comment = NA,
    quiet = TRUE,
    progress = FALSE,
    tidy = FALSE,
    cache = FALSE,
    message = FALSE,
    error = FALSE, # FALSE: always stop execution.
    warning = TRUE,
    dpi = 100
)

## ---- echo = FALSE-------------------------------------------------------
knitr::opts_knit$set(global.par = TRUE)

## ---- echo = FALSE-------------------------------------------------------
par(mar = c(3, 3, 2, 2), mgp = c(1.7, 0.5, 0), las = 1, cex.main = 1, tcl = -0.2, cex.axis = 0.8,
    cex.lab = 0.8)

## ------------------------------------------------------------------------
# the 'spup' library contains functions described below
# and it loads all the dependencies
library(spup)
library(dplyr) # a grammar of data manipulation
library(readr) # fast I/O
library(whisker) # rendering methods
library(purrr)

# set seed
set.seed(12345)

## ------------------------------------------------------------------------
read_lines("examples/input.txt")

## ------------------------------------------------------------------------
read_lines("examples/input.txt.template")

## ------------------------------------------------------------------------
my_template <- "Hello {{name}}. How are you doing?"

my_template %>% 
    render(name = "Winnie the Pooh")


## ------------------------------------------------------------------------
my_template <- c(
    "| x | y |",
    "|---|---|",
    "{{#MY_TABLE}}",
    "| {{X}} | {{Y}} |",
    "{{/MY_TABLE}}"
)

my_table <- data.frame(X = 1:5, Y = letters[1:5])
my_table

my_template %>% 
    render(MY_TABLE = unname(rowSplit(my_table))) %>%
    cat

## ------------------------------------------------------------------------
my_template <- template("examples/input.txt.template")

## ------------------------------------------------------------------------
my_template %>% 
    read_lines

## ------------------------------------------------------------------------
my_template %>% 
    render(b0 = 3, b1 = 4)

## ------------------------------------------------------------------------
my_template %>% 
    render(b0 = 3, b1 = 4) %>%
    read_lines

## ---- eval = FALSE-------------------------------------------------------
#  dummy_model <- executable("examples/dummy_model.exe")

## ---- eval = FALSE-------------------------------------------------------
#  # create template
#  my_template <- template("examples/input.txt.template")
#  
#  # render the template
#  render(my_template, b0 = 3.1, b1 = 4.2)
#  
#  # run external model
#  dummy_model()
#  
#  # read output (output file of dummy_model is "output.txt")
#  scan(file = "examples/output.txt", quiet = TRUE)

## ---- eval = FALSE-------------------------------------------------------
#  # number of Monte Carlo runs
#  n_realizations <- 100
#  
#  n_realizations %>%
#      purrr::rerun({
#          # render template
#          render(my_template, b0 = rnorm(n = 1), b1 = runif(n = 1))
#  
#          # run model
#          dummy_model()
#  
#          # read output
#          scan("examples/output.txt", quiet = TRUE)
#      }) %>%
#      set_names(paste0("r", 1:n_realizations)) %>%
#      as_data_frame %>%
#      apply(MARGIN = 1, FUN = quantile)

