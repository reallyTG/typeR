## ----setup, echo = FALSE, message = FALSE--------------------------------
knitr::opts_chunk$set(tidy = FALSE, comment = "#>")
options(ddpcr.verbose = TRUE)

## ----installpkg, eval = FALSE--------------------------------------------
#  install.packages("ddpcr")

## ----quickstart, message = FALSE, fig.show='hold', out.width='50%', fig.retina=FALSE----
library(ddpcr)
dir <- sample_data_dir()

# example 1: manually set thresholds
plate1 <-
  new_plate(dir, type = plate_types$custom_thresholds) %>%
  subset("A01,A05") %>%
  set_thresholds(c(5000, 7500)) %>%
  analyze()
plot(plate1, show_grid_labels = TRUE, alpha_drops = 0.3,
       title = "Manually set gating thresholds\nworks with any data")

# example 2: automatic gating
new_plate(dir, type = plate_types$fam_positive_pnpp) %>%
  subset("A01:A05") %>%
  analyze() %>%
  plot(show_mutant_freq = FALSE, show_grid_labels = TRUE, alpha_drops = 0.3,
       title = "Automatic gating\nworks with PNPP experiments")

## ----readdata------------------------------------------------------------
library(ddpcr)
dir <- sample_data_dir()
plate <- new_plate(dir)

## ----plotraw-------------------------------------------------------------
plot(plate)

## ----printprint----------------------------------------------------------
plate

## ----explore-1-----------------------------------------------------------
plate %>% name()  # equivalent to `name(plate)`
plate %>% type()  # equivalent to `type(plate)`

## ----explore-2-----------------------------------------------------------
plate %>% wells_used()

## ----explore-3-----------------------------------------------------------
plate %>% plate_data()

## ----explore-5-----------------------------------------------------------
plate %>% plate_meta(only_used = TRUE)

## ----subset--------------------------------------------------------------
plate <- plate %>% subset("A01:C05")
# could have also used subset("A01, A05, C01, C05")
plate %>% wells_used()

## ----steps---------------------------------------------------------------
plate

## ----analyze-------------------------------------------------------------
plate <- plate %>% analyze()
# equivalent to `plate %>% next_step(3)`
# also equivalent to `plate %>% next_step() %>% next_step() %>% next_step()`

## ----explore-post-1------------------------------------------------------
plate

## ----explore-post-2------------------------------------------------------
plate %>% plate_data()

## ----explore-post-3------------------------------------------------------
plate %>% plate_meta(only_used = TRUE)

## ----explore-post-4------------------------------------------------------
well_info(plate, "A05", "drops_empty")

## ----plotsimple----------------------------------------------------------
plate %>% plot()

## ----plotparams, fig.show='hold', out.width='50%', fig.retina=FALSE------
plate %>% plot(wells = "A01,A05", show_full_plate = TRUE,
               show_drops_empty = TRUE, col_drops_empty = "red",
               title = "Show full plate")
plate %>% plot(wells = "A01,A05", superimpose = TRUE,
               show_grid = TRUE, show_grid_labels = TRUE, title = "Superimpose")

## ----saveload------------------------------------------------------------
plate %>% save_plate("myplate")
from_file <- load_plate("myplate")
identical(plate, from_file)
unlink("myplate.rds")

## ----reset, message=FALSE------------------------------------------------
# two ways to create the desired plate
plate_manual <- reset(plate, type = plate_types$custom_thresholds)
plate_manual2 <- new_plate(dir, type = plate_types$custom_thresholds) %>%
  subset("A01:C05")

# make sure the two methods above are identical
identical(plate_manual, plate_manual2)

plate_manual

## ----plotcrosshair-------------------------------------------------------
plot(plate_manual, show_grid_labels = TRUE)

## ----setthresholds-------------------------------------------------------
# what are the current thresholds?
thresholds(plate_manual)
# set the thresholds to (5000,8000)
thresholds(plate_manual) <- c(5000, 8000)
plate_manual <- analyze(plate_manual)

## ----crosshairresults----------------------------------------------------
plate_meta(plate_manual, only_used = TRUE)
plot(plate_manual)

## ----crosshairclusters---------------------------------------------------
clusters(plate_manual)

## ----pnppdefine----------------------------------------------------------
plate_pnpp <- new_plate(dir, type = plate_types$fam_positive_pnpp)

## ----pnppclusters--------------------------------------------------------
clusters(plate_pnpp)

## ----pnppanalyze---------------------------------------------------------
plate_pnpp <- analyze(plate_pnpp)

## ----pnppmeta------------------------------------------------------------
plate_pnpp %>% plate_meta(only_used = TRUE)

## ----pnppplot------------------------------------------------------------
plate_pnpp %>% plot(text_size_mutant_freq = 8)

## ----pnppnegpos----------------------------------------------------------
plate_pnpp %>% wells_mutant()
plate_pnpp %>% wells_wildtype()

## ----paramsstr-----------------------------------------------------------
plate %>% params() %>% str()

## ----paramsfailures------------------------------------------------------
plate %>% params("REMOVE_FAILURES")

## ----setparams-----------------------------------------------------------
params(plate, "REMOVE_FAILURES", "TOTAL_DROPS_T")
params(plate, "REMOVE_FAILURES", "TOTAL_DROPS_T") <- 1000
params(plate, "REMOVE_FAILURES", "TOTAL_DROPS_T")

## ----changexvar----------------------------------------------------------
orig_x <- x_var(plate)
orig_x
x_var(plate) <- "VIC"
plate %>% plate_data() %>% names()
x_var(plate) <- orig_x

## ----reanalyze-----------------------------------------------------------
plate <- analyze(plate)
plate <- analyze(plate, restart = TRUE)

## ----exactsteps----------------------------------------------------------
plate_pnpp %>% steps

## ----stepsource----------------------------------------------------------
ddpcr:::init_plate

