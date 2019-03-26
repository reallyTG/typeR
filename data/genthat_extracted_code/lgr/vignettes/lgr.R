## ----setup, include = FALSE----------------------------------------------
library(lgr)

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
# the root logger is called "lgr"
lgr$info("Vampire stories are generally located in Styria.")

## ------------------------------------------------------------------------
lgr$error("Vampires generally arrive in carriages drawn by %i black horses.", 2)

## ------------------------------------------------------------------------
tf <- tempfile(fileext = ".info")
lgr$add_appender(AppenderFile$new(tf), name = "file")
lgr$info("You must think I am joking")
readLines(tf)

## ------------------------------------------------------------------------
lgr$appenders$file$set_layout(LayoutFormat$new(timestamp_fmt = "%B %d %T"))
lgr$info("No, I am quite serious")
readLines(tf)

## ------------------------------------------------------------------------
# cleanup behind the old Appender
unlink(tf)  
lgr$remove_appender("file")

# setup a JSON appender
lgr$add_appender(AppenderJson$new(tf), name = "json")
lgr$info("We lived in Styria")

## ------------------------------------------------------------------------
cat(readLines(tf))

## ------------------------------------------------------------------------
read_json_lines(tf)

## ------------------------------------------------------------------------
# The default console appender displays custom fields as pseudo-json after the message
lgr$info("Styria has", poultry = c("capons", "turkeys"))

# JSON can store most R objects quite naturally 
read_json_lines(tf)
read_json_lines(tf)$poultry[[2]]  # works because poultry is a list column

## ----echo = FALSE--------------------------------------------------------
lgr$remove_appender("json")
unlink(tf)

## ---- echo = FALSE-------------------------------------------------------
ll <- data.frame(
  `Level` = c(0, seq(100, 600, by = 100), NA),
  `Name` = c("off", "fatal", "error", "warn", "info", "debug", "trace", "all"),
  `Description` = c(
    "A log level of 0/off tells a Logger or Appender to suspend all logging",
    "Critical error that leads to program abort. Should always indicate a `stop()` or similar",
    "A severe error that does not trigger program abort",
    "A potentially harmful situation, like `warning()`",
    "An informational message on the progress of the application",
    "Finer grained informational messages that are mostly useful for debugging",
    "An even finer grained message than debug",
    "A log level of NA/all tells a Logger or Appender to process all log events"
  )
) 

knitr::kable(ll)

## ------------------------------------------------------------------------
lgr$fatal("This is an important message about %s going wrong", "->something<-")
lgr$trace("Trace messages are still hidden")
lgr$appenders$console$set_threshold("trace")
lgr$trace("Unless we lower the threshold")
lgr$appenders$memory$show(3)


## ------------------------------------------------------------------------
lgr$info("The sky was the color of %s, tuned to a dead chanel", "television")

## ------------------------------------------------------------------------
lgr$info("Vampire stories are generally located in Styria")
lgr$last_event  # a summary output of the event
lgr$last_event$values  # all values stored in the event as a list

## ------------------------------------------------------------------------
# bad
lgr$info("Processing track '%s' with %s waypoints", "track.gpx", 32)

# Good
tf <- tempfile()
lgr$add_appender(AppenderJson$new(tf), "json")
lgr$info("Processing track", file = "track.gpx", waypoints = 32)
lgr$appenders$json$data


## ----echo = FALSE--------------------------------------------------------
lgr$remove_appender("json")
unlink(tf)

## ------------------------------------------------------------------------
f1 <- function(event) { grepl("bird", event$msg) }
lgr$set_filters(list(f1))

lgr$info("is it a plane?")
lgr$info("no! is it a bird?")

# since this is not a very useful filter, we better remove it again
lgr$set_filters(NULL)

## ------------------------------------------------------------------------
tf <- tempfile()

# Add a new appender to a logger. We don't have to supply a name, but that
# makes it easier to remove later.
lgr$add_appender(AppenderFile$new(file = tf), name = "file")

# configure lgr so that it logs everything to the file, but only info and above
# to the console
lgr$set_threshold(NA)
lgr$appenders$console$set_threshold("info")
lgr$appenders$file$set_threshold(NA)
lgr$info("Another informational message")
lgr$debug("A debug message not shown by the console appender")

readLines(tf)

# Remove the appender again
lgr$remove_appender("file")

## ----echo = FALSE--------------------------------------------------------
unlink(tf)

## ------------------------------------------------------------------------
# install.packages("glue")

l <- LoggerGlue$new("glue_logger")

l$info(
  "glue automatically ", 
  "pastes together unnamed arguments ",
  "and evaluates arbitray expressions inside braces {Sys.Date()}"
)


## ------------------------------------------------------------------------
l$info("For more info on glue see {website}", website = "https://glue.tidyverse.org/")

## ------------------------------------------------------------------------
l$info("Glue is available from {.cran}", .cran = "https://CRAN.R-project.org/package=glue")

## ------------------------------------------------------------------------
lg <- Logger$new(
  "test", 
  appenders = list(cons = AppenderConsole$new()), 
  propagate = FALSE
)

lg$info("the default format")
lg$appenders$cons$layout$set_fmt("%L (%n) [%t] %c(): !! %m !!")
lg$info("A more involved custom format")

## ------------------------------------------------------------------------
# install.packages("glue")
library(glue)
lg$appenders$cons$set_layout(LayoutGlue$new(
  fmt = "{.logger$name} {level_name} {caller}: {toupper(msg)}"
))
lg$info("with glue")

## ------------------------------------------------------------------------
# install.packages("jsonlite")
tf <- tempfile()

lg <- Logger$new(
  "test logger",
  appenders = list(json = AppenderJson$new(file = tf)), 
  propagate = FALSE
)

lg$info("JSON naturally ", field = "custom")
lg$info("supports custom", numbers = 1:3)
lg$info("log fields", use = "JSON")


## ----eval = FALSE--------------------------------------------------------
#  lg$appenders$json$data
#  # same as
#  read_json_lines(tf)

## ----echo = FALSE--------------------------------------------------------
lg$appenders$json$data

## ----eval = FALSE--------------------------------------------------------
#  lg$appenders$json$show()
#  # same as
#  cat(readLines(tf), sep = "\n")

## ----echo = FALSE--------------------------------------------------------
lg$appenders$json$show()

## ---- echo = FALSE-------------------------------------------------------
unlink(tf)

## ------------------------------------------------------------------------
# The logger name should be the same as the package name
tf <- tempfile()
lg <- Logger$new("mypackage", appenders = AppenderFile$new(tf))  

## ------------------------------------------------------------------------
print(lg)

## ------------------------------------------------------------------------
lg$info("A test message for lg")

## ------------------------------------------------------------------------
lg$set_propagate(FALSE)

## ------------------------------------------------------------------------
print(lg)

## ------------------------------------------------------------------------
lg$info("Nothing to see here")

## ----echo = FALSE--------------------------------------------------------
unlink(tf)

## ------------------------------------------------------------------------
lg <- Logger$new(
  "buffer example",
  threshold = NA,
  propagate = FALSE,  # to suppress console output
  appenders = AppenderBuffer$new(
    threshold = NA,
    buffer_size = 5, # can hold 5 events, the 6th will trigger flushing
    flush_on_exit = FALSE,
    flush_on_rotate = FALSE,
    should_flush = function(event) event$level <= 200,
    appenders = AppenderConsole$new(threshold = NA)
  )
)

for (nm in month.name[1:8]) lg$debug("%s", nm)
lg$error("But the days grow short when you reach September")

## ------------------------------------------------------------------------
# install.packages("RSQLite")
lg <- Logger$new(
  "db_logger",
  appenders = list(db = AppenderDbi$new(
    conn = DBI::dbConnect(RSQLite::SQLite()),
    table = "log",
    buffer_size = 2L
  )), 
  propagate = FALSE
)

lg$info("Logging to databases uses a buffer")
lg$info("As the buffer size is 2, no insert took place till now")
lg$appenders$db$show()

lg$info("Now as the buffer is rotated, all events are output to the db")
lg$appenders$db$show()

## ------------------------------------------------------------------------
# setup an example function
clean   <- function() lgr$info("cleaning data")
process <- function() lgr$info("processing data")
output  <- function() lgr$info("outputing data")

analyze <- function(){
  clean()
  process()
  output()
}

## ----eval = FALSE--------------------------------------------------------
#  with_log_value(
#    list(dataset_id = "dataset1"),
#    analyze()
#  )

## ----eval = FALSE--------------------------------------------------------
#  analyze <- function(id = "dataset1"){
#    lgr$add_filter(FilterInject$new(dataset_id = id), name = "inject")
#    on.exit(lgr$remove_filter("inject"))
#  
#    clean()
#    process()
#    output()
#  }
#  analyze()

## ---- echo = FALSE-------------------------------------------------------
with_log_value(
  list(dataset_id = "dataset1"), 
  analyze()
)

## ------------------------------------------------------------------------
without_logging({
  lgr$warn("Oh Yeah?")
  lgr$fatal("Oh No")
})

## ------------------------------------------------------------------------
# mypackage/R/mypackage-package.R
.onLoad <- function(...){
  assign(
    "lg",  # the recommended name for a logger object
    lgr::Logger$new(name = "mypackage"),  # should be the same as the package name
    envir = parent.env(environment())
  )
}


