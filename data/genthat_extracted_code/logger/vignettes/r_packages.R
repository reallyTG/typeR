## ----pkgchecks, echo = FALSE---------------------------------------------
## check if other logger packages are available and exit if not
for (pkg in c('devtools')) {
    if (!requireNamespace(pkg, quietly = TRUE)) {
        warning(paste(pkg, 'package not available, so cannot build this vignette'))
        knitr::knit_exit()
    }
}

## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(logger)
devtools::load_all(system.file('demo-packages/logger-tester-package', package = 'logger'))
logger_tester_function(INFO, 'hi from tester package')

