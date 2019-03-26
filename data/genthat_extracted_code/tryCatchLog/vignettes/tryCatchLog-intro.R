## ----setup, include=FALSE------------------------------------------------
# knitr::opts_chunk$set(echo = TRUE, error = TRUE)  # render R errors as output instead of stopping to knit

## ---- error = TRUE-------------------------------------------------------
log("text")   # calculating the logarithm of a string throws an error

## ---- results='hold'-----------------------------------------------------
log(-1)                # logarithm of a negative number throws a warning

## ---- error = TRUE-------------------------------------------------------
if (1 != 2)
  stop("something is wrong")

## ---- error = TRUE-------------------------------------------------------
stopifnot(1 == 2)

## ------------------------------------------------------------------------
warning("bad weather today, don't forget your umbrella")

## ------------------------------------------------------------------------
message("good morning")

## ---- error = TRUE, eval = TRUE------------------------------------------
options(error = NULL)  # switch to default behaviour of pure R

test <- function() {
  log("not a number")
  print("R does stop due to an error and never executes this line")
}

test()     # throws an error

## ---- error = TRUE, collapse = FALSE, eval = TRUE------------------------
try(log("not a number"), silent = TRUE)
print("errors can't stop me")

## ------------------------------------------------------------------------
an.error.occured <- FALSE
tryCatch( { result <- log("not a number"); print(res) }
          , error = function(e) {an.error.occured <<- TRUE})
print(an.error.occured)

## ------------------------------------------------------------------------
tryCatch( { result <- log(-1); print(result) }
          , warning = function(w) { print("Hey, a warning") })

## ------------------------------------------------------------------------
last.message <- NULL
tryCatch( { message("please handle me"); print("Done") }
          , message = function(m) { last.message <<- m })
print(last.message$message)

## ------------------------------------------------------------------------
condition <- function(subclass, message, call = sys.call(-1), ...) {
  structure( class = c(subclass, "condition"),
             list(message = message, call = call, ...))
}

tryCatch( { work <- condition("my.work.condition", "after work party")
            signalCondition(work); print("Done") }
          , my.work.condition = function(c) { print(c$message) })

## ------------------------------------------------------------------------
{ # required to execute the code as one block to summarize the output in this Rmd
  f <- function() {
    warning("deprecated function called")
    print("Hello world")
  }
  f()
  print("Done")
}

## ---- echo=FALSE---------------------------------------------------------
# dummy code to avoid a "missing function" error in the next code junk
write.to.log <- function(msg) { invisible() }

## ------------------------------------------------------------------------
f <- function() {
  warning("deprecated function called")
  print("Hello world")
}
tryCatch(f(), warning = function(w) { write.to.log(w) })
print("Done")

## ---- error = TRUE, eval = FALSE-----------------------------------------
#  options(error=function() traceback(2)) # http://stackoverflow.com/a/13119318/4468078
#  f <- function() {
#    log("not a number")
#    print("Hello world")
#  }
#  f()

## ---- eval = FALSE-------------------------------------------------------
#  Error in log("not a number") :
#    non-numeric argument to mathematical function
#  6: (function ()
#     traceback(2))() at f.R#3
#  5: f() at f.R#6
#  ...
#  1: source("f.R")

## ---- error = TRUE, eval = FALSE-----------------------------------------
#  f <- function() {
#    log("not a number")
#    print("Hello world")
#  }
#  tryCatch(f(), error = function(e) { traceback() })

## ---- eval = FALSE-------------------------------------------------------
#  8: value[[3L]](cond)
#  7: tryCatchOne(expr, names, parentenv, handlers[[1L]])
#  6: tryCatchList(expr, classes, parentenv, handlers)
#  5: tryCatch(f(), error = function(e) {
#         traceback(2)
#     }) at f.R#5
#  ...
#  1: source("f.R")

## ------------------------------------------------------------------------
f <- function() {
  warning("deprecated function called")
  print("Hello world")
}
withCallingHandlers(f(), warning = function(w) { write.to.log(sys.calls()) })

## ---- results = 'hold'---------------------------------------------------
f <- function() {
  warning("deprecated function called")
  print("Hello old world")
}
withCallingHandlers(f(), warning = function(w) { write.to.log(sys.calls())
                                                 invokeRestart("muffleWarning")})
print("Done")

## ---- results='hold'-----------------------------------------------------
f <- function() {
  warning("deprecated function called")
  print("A warning cannot stop me")
  log("not a number")
  print("Hello old world")
}

tryCatch(withCallingHandlers(f(), error=function(e) {write.to.log(sys.calls())}
                                , warning=function(w) {write.to.log(sys.calls())
                                                invokeRestart("muffleWarning")})
         , error = function(e) { print("recovered from error") })
print("Done")

## ---- eval = FALSE-------------------------------------------------------
#  # install.packages("devtools")
#  library(devtools)
#  install_github("aryoda/tryCatchLog")

## ---- results = 'hide', message = FALSE, echo = FALSE--------------------
library(tryCatchLog)   # load the package to avoid startup messages in the results later

## ---- eval = FALSE, warning=F--------------------------------------------
#  library(tryCatchLog)
#  f <- function(value) {
#    print("begin")
#    log(value)            # negative number -> warning; string -> error
#    print("end")
#  }
#  tryLog(f("not a number"))
#  print("Errors don't stop me!")

## ---- eval = FALSE-------------------------------------------------------
#  ## [1] "begin"
#  ## ERROR [2016-12-06 21:44:21] non-numeric argument to mathematical function
#  ## Compact call stack:
#  ##   1 test.R#7: tryLog(f("not a number"))
#  ##   2 tryCatchLog.R#345: tryCatchLog(expr = expr, write.error.dump.file = write.error.dump.file, error = function(e) {
#  ##   3 tryCatchLog.R#259: tryCatch(withCallingHandlers(expr, error = function(e) {
#  ##   4 test.R#4: .handleSimpleError(function (e)
#  ## ...
#  ## [1] "Errors don't stop me!"

## ---- eval = FALSE, warning=F--------------------------------------------
#  library(tryCatchLog)
#  f <- function(value) {
#    print("begin")
#    log(value)            # negative number -> warning; string -> error
#    print("end")
#  }
#  tryLog(f(-1))

## ----eval = FALSE--------------------------------------------------------
#  ## [1] "begin"
#  ## WARN [2016-12-06 21:33:41] NaNs produced
#  ## Compact call stack:
#  ##   1 test.R#7: tryLog(f(-1))
#  ##   2 tryCatchLog.R#345: tryCatchLog(expr = expr, write.error.dump.file = write.error.dump.file, error = function(e) {
#  ##   3 tryCatchLog.R#259: tryCatch(withCallingHandlers(expr, error = function(e) {
#  ##   4 test.R#4: .signalSimpleWarning("NaNs produced", quote(log(value)))
#  ...
#  ## [1] "end"

## ---- eval = FALSE-------------------------------------------------------
#  library(tryCatchLog)
#  
#  send.email <- function(receiver, body) { }  # dummy function (does nothing)
#  
#  tryCatchLog(log("not a number"),
#              error = function(e) { send.email("admin@home", e)
#              })

## ---- eval = FALSE-------------------------------------------------------
#  ERROR [2017-01-22 22:04:56] non-numeric argument to mathematical function
#  Compact call stack:
#    1 tryCatchLog_error_example.R#5: tryCatchLog(log("not a number"), error = function(e) {
#    2 tryCatchLog.R#273: tryCatch(withCallingHandlers(expr, error = function(e) {
#  ...

## ----eval = FALSE--------------------------------------------------------
#    library(futile.logger)
#  
#    flog.appender(appender.file("app.log"))
#  
#    flog.threshold(ERROR)    # TRACE, DEBUG, INFO, WARN, ERROR, FATAL
#  
#    try(log(-1))             # the warning will not be logged!

## ----eval = FALSE--------------------------------------------------------
#  library(tryCatchLog)
#  f <- function(value) {
#    log(value)
#  }
#  a <- "100"
#  tryLog(f(a), write.error.dump.file = TRUE)

## ----eval = FALSE--------------------------------------------------------
#  ERROR [2016-12-12 22:29:52] non-numeric argument to mathematical function
#  Call stack environments dumped into file: dump_20161212_222952.rda
#  Compact call stack:
#    1 source("~/R_trainings/tryCatchLog/src/test.R")
#    2 test.R#6: tryLog(f(a), write.error.dump.file = TRUE)
#    3 tryCatchLog.R#348: tryCatchLog(expr = expr, write.error.dump.file = write.error.dump.file, error = function(e) {
#    4 tryCatchLog.R#262: tryCatch(withCallingHandlers(expr, error = function(e) {
#    5 test.R#3: .handleSimpleError(function (e)
#    ...

## ----eval = FALSE--------------------------------------------------------
#  load("dump_20161212_222952.rda")    # load the dump into the global environment
#  debugger(last.dump)                 # start the post-mortem analysis

## ----eval = FALSE--------------------------------------------------------
#  Message:  non-numeric argument to mathematical functionAvailable environments had calls:
#  1: source("test.R")
#  ...
#  5: test.R#6: tryLog(f(a), write.error.dump.file = TRUE)
#  6: tryCatchLog.R#348: tryCatchLog(expr = expr, write.error.dump.file = dump.erro
#  7: tryCatchLog.R#262: tryCatch(withCallingHandlers(expr, error = function(e) {
#  ...
#  12: f(a)
#  13: test.R#3: .handleSimpleError(function (e)
#  14: h(simpleError(msg, call))
#  
#  Enter an environment number, or 0 to exit
#  Selection: <Cursor is waiting for your input here>

## ----eval = FALSE--------------------------------------------------------
#  Enter an environment number, or 0 to exit
#  Selection: 12
#  Browsing in the environment with call:
#     f(a)
#  Called from: debugger.look(ind)
#  Browse[1]> ls()
#  [1] "value"
#  Browse[1]> value
#  [1] "100"
#  Browse[1]> typeof(value)
#  [1] "character"
#  Browse[1]>

## ----eval = FALSE--------------------------------------------------------
#  tryCatchLog(expr, ..., finally = NULL,
#    write.error.dump.file = getOption("tryCatchLog.write.error.dump.file", FALSE),
#    silent.warnings       = getOption("tryCatchLog.silent.warnings", FALSE),
#    silent.messages       = getOption("tryCatchLog.silent.messages", FALSE))

## ----eval = FALSE--------------------------------------------------------
#  tryLog(expr,
#    write.error.dump.file = getOption("tryCatchLog.write.error.dump.file", FALSE),
#    silent.warnings       = getOption("tryCatchLog.silent.warnings", FALSE),
#    silent.messages       = getOption("tryCatchLog.silent.messages", FALSE))

## ----results = "hide"----------------------------------------------------
# Initialize your own default values globally for tryLog and tryCatchLog
options(tryCatchLog.write.error.dump.file = FALSE)
options(tryCatchLog.silent.messages       = TRUE)
options(tryCatchLog.silent.warnings       = TRUE)

test <- function() {
  message("hello")
  warning("a warning")
}

# Use your own default values by ommiting those parameters...
tryLog(f())

# .. instead of the longer version which passes each parameter again and again
tryLog(f(), silent.warnings=TRUE, silent.messages=TRUE, write.error.dump.file=FALSE)

## ----eval = FALSE--------------------------------------------------------
#  library(futile.logger)
#  library(tryCatchLog)
#  
#  options(keep.source = TRUE)        # source code file name and line number tracking
#  options("tryCatchLog.write.error.dump.file" = TRUE) # dump for post-mortem analysis
#  
#  flog.appender(appender.file("my_app.log"))  # to log into a file instead of console
#  flog.threshold(INFO)    # TRACE, DEBUG, INFO, WARN, ERROR, FATAL
#  
#  tryCatchLog(source("your_main_script.R"))

