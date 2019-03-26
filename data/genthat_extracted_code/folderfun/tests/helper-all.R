# helper-all.R
# Ancillary functions for setff tests
# Author: Vince Reuter
# Email: vpr9v@virginia.edu

# Remove (set as NULL) the option this package uses to store a named variable,
# and remove the variable storing its fetcher function.
cleanFfSetting = function(n) {
  optArg = list(NULL)
  names(optArg) = paste0(.FFTAGOPT, n)
  options(optArg)
  do.call(what = rm, args = list(paste0(.FFTAGFUNC, n), pos = globalenv()))
}

# Randomize lowercase alphabetic string of length in specified range.
getRandVarName = function(minLen = 10, maxLen = 20) {
  if (minLen < 1 || maxLen < 1) stop(sprintf(
    "Character count bound(s) for string randomization must be positive; got [%d, %d]", 
    minLen, maxLen))
  if (maxLen < minLen) stop(sprintf(
    "Max chars < min chars for random string: %d < %d", maxLen, minLen))
  paste0(sample(letters, sample(minLen:maxLen)), collapse = "")
}

neitherOptNorEnvVar = function(n) { stopifnot(
  is.null(getOption(n)) && identical("", Sys.getenv(n))) }

# Randomly select a subset of a name's characters to convert to uppercase
tomixed = function(name) {
  if (tolower(name) != name) stop("Not all lowercase: ", name)
  chars = unlist(strsplit(name, ""))    
  indices = sample(1:length(chars), sample(1:(length(chars) - 1)))
  mixed = sapply(1:length(chars), 
    function(i) ifelse(i %in% indices, toupper(chars[i]), chars[i]))
  paste0(mixed, collapse="")
}

# Cleanup the package opt/var name and function name associated with setff.
validateFfCleanup = function(var) {
  suppressWarnings(cleanFfSetting(var))
  neitherOptNorEnvVar(paste0(.FFTAGOPT, var))
  funcName = paste0(.FFTAGFUNC, var)
  if (exists(funcName)) stop("Failed to remove function: ", funcName)
}
