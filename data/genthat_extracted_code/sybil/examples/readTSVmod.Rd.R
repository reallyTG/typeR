library(sybil)


### Name: readTSVmod
### Title: Read a Metabolic Network in a TSV (CSV) Format
### Aliases: readTSVmod
### Keywords: IO

### ** Examples

  ## read example dataset
  mp  <- system.file(package = "sybil", "extdata")
  mod <- readTSVmod(prefix = "Ec_core", fpath = mp, quoteChar = "\"")

  ## redirect warnings to a log file
  sink(file = "warn.log")
  mod <- readTSVmod(prefix = "Ec_core", fpath = mp, quoteChar = "\"")
  warnings()
  sink()
  unlink("warn.log")  

  ## print no warnings
  suppressWarnings(
    mod <- readTSVmod(prefix = "Ec_core", fpath = mp, quoteChar = "\""))

  ## print no messages
  suppressMessages(
    mod <- readTSVmod(prefix = "Ec_core", fpath = mp, quoteChar = "\""))

## Not run: 
##D   ## set number of warnings to keep
##D   options(nwarnings = 1000)
##D   
##D   ## redirect every output to a file
##D   zz <- file("log.Rout", open = "wt")
##D   sink(zz)
##D   sink(zz, type = "message")
##D   mod <- readTSVmod(prefix = "Ec_core", fpath = mp, quoteChar = "\"")
##D   warnings()
##D   sink(type = "message")
##D   sink()
##D   close(zz)  
## End(Not run)



