## Record original state
ovars <- ls()
oenvs <- oenvs0 <- Sys.getenv()
oopts0 <- options()

## Default options
oopts <- options(
  warn=1L
)

isPackageInstalled <- R.utils::isPackageInstalled
loadToEnv <- R.utils::loadToEnv
fullTest <- (Sys.getenv("_R_CHECK_FULL_") != "")

## Local functions for test scripts
printf <- function(...) cat(sprintf(...))
mstr <- function(...) message(paste(capture.output(str(...)), collapse="\n"))
