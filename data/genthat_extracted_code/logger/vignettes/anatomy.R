## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
    collapse = TRUE,
    comment = "#>"
)
library(logger)

## ------------------------------------------------------------------------
f <- function() get_logger_meta_variables(log_level = INFO)
f()

## ------------------------------------------------------------------------
log_threshold()
ERROR <= INFO
log_error('Oops')

## ------------------------------------------------------------------------
formatter <- function(...) paste(..., collapse = ' ', sep = ' ')
formatter(1:3, c('foo', 'bar'))

## ------------------------------------------------------------------------
appender <- function(line) cat(line, '\n')
appender('INFO [now] I am a log message')

## ------------------------------------------------------------------------
log_threshold(INFO)
log_formatter(formatter_glue)
log_layout(layout_simple)
log_appender(appender_console)
log_debug('I am a low level log message that will not be printed with a high log level threshold')
log_warn('I am a higher level log message that is very likely to be printed')

