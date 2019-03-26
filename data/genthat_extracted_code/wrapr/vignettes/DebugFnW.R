## ----setup---------------------------------------------------------------
# load package
library("wrapr")

# user function
f <- function(i) { (1:10)[[i]] }


## ----unwrapped-----------------------------------------------------------

inputs = c(4,5,2,9,0,8)

tryCatch(
  for(x in inputs) {
     f(x)
  },
  error = function(e) { print(e) })

## ----writeBackVersion2---------------------------------------------------
# wrap function with writeBack
df <- DebugFnW(as.name('lastError'), f)

## ----writeBackVersion3---------------------------------------------------
# capture error (Note: tryCatch not needed for user code!)
tryCatch(
  for(x in inputs) {
     df(x)
  },
  error = function(e) { print(e) })

## ----writeBackVersion4---------------------------------------------------
# examine error
str(lastError)
lastError$args

## ----writeBackVersion5---------------------------------------------------
# redo call, perhaps debugging
tryCatch(
  do.call(lastError$fn_name, lastError$args),
  error = function(e) { print(e) })
# clean up
rm(list='lastError')

## ----FileVersion, eval=FALSE---------------------------------------------
#  saveDest <- paste0(tempfile('debug'),'.RDS')
#  # wrap function with saveDeest
#  df <- DebugFnW(saveDest,f)
#  # capture error (Note: tryCatch not needed for user code!)
#  tryCatch(
#    for(x in inputs) {
#      df(x)
#    },
#    error = function(e) { print(e) })

## ----FileVersion2, eval=FALSE--------------------------------------------
#  # load data
#  lastError <- readRDS(saveDest)
#  # examine error
#  str(lastError)
#  # redo call, perhaps debugging
#  tryCatch(
#    do.call(lastError$fn_name, lastError$args),
#    error = function(e) { print(e) })
#  # clean up
#  file.remove(saveDest)

