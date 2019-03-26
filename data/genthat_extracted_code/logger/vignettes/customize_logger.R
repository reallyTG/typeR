## ----pkgchecks, echo = FALSE---------------------------------------------
## check if other logger packages are available and exit if not
for (pkg in c('devtools', 'parallel')) {
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

library(logger)
## backup settings
oldconf <- list(
    threshold = log_threshold(),
    layout = log_layout(),
    formatter = log_formatter(),
    appender = log_appender())

## ------------------------------------------------------------------------
log_info('Hi, there!')
log_debug('How are you doing today?')
log_threshold()
log_threshold(TRACE)
log_debug('How are you doing today?')

## ------------------------------------------------------------------------
log_level(INFO, 'Hi, there!')

## ------------------------------------------------------------------------
log_threshold(INFO)
log_debug('pst, can you hear me?')
log_info('no')

with_log_threshold(log_debug('pst, can you hear me?'), threshold = TRACE)
log_info('yes')

with_log_threshold({
    log_debug('pst, can you hear me?')
    log_info('yes')
}, threshold = TRACE)

## ------------------------------------------------------------------------
log_threshold(INFO)
log_trace('Hi, there!', namespace = 'kitchensink')
log_info('Hi, there!', namespace = 'kitchensink')

## ------------------------------------------------------------------------
log_threshold(TRACE, namespace = 'kitchensink')
log_trace('Hi, there!', namespace = 'kitchensink')
log_info('Hi, there!', namespace = 'kitchensink')
log_trace('Hi, there!')

## ------------------------------------------------------------------------
log_formatter(formatter_glue)
log_info('There are {nrow(mtcars)} cars in the mtcars dataset')
log_info('2 + 2 = {2+2}')

## ------------------------------------------------------------------------
log_info(42)
log_info('The answer is {42}')
log_info('The answers are {1:5}')

## ------------------------------------------------------------------------
log_layout(layout_json())
log_info(42)
log_info('The answer is {42}')
log_info('The answers are {1:5}')

## ------------------------------------------------------------------------
logger <- layout_glue_generator(format = '{node}/{pid}/{namespace}/{fn} {time} {level}: {msg}')
log_layout(logger)

## ------------------------------------------------------------------------
log_info('foo')

## ------------------------------------------------------------------------
f <- function() log_info('foo')
f()

## ------------------------------------------------------------------------
devtools::load_all(system.file('demo-packages/logger-tester-package', package = 'logger'))
logger_tester_function(INFO, 'hi from tester package')

## ------------------------------------------------------------------------
log_threshold(namespace = 'logger.tester')
log_threshold(WARN, namespace = 'logger.tester')
logger_tester_function(INFO, 'hi from tester package')
logger_tester_function(WARN, 'hi from tester package')
log_info('I am still working in the global namespace')

## ------------------------------------------------------------------------
log_layout()

## ------------------------------------------------------------------------
## reset layout
log_layout(layout_simple)

## ------------------------------------------------------------------------
log_appender()

## ------------------------------------------------------------------------
t <- tempfile()
log_appender(appender_file(t))
log_info('where is this message going?')
log_appender()
readLines(t)
unlink(t)

## ------------------------------------------------------------------------
## reset appender
log_appender(appender_console)

## ------------------------------------------------------------------------
log_threshold()

## create a new logger with index 2
log_threshold(TRACE, index = 2)

## note that the original logger still have the same log level threshold
log_threshold()
log_threshold(index = 2)

## update the appender of the new logger
t <- tempfile()
log_appender(appender_file(t), index = 2)

## test both loggers
log_info('info msg')
log_debug('info msg')

readLines(t)
unlink(t)

## ----cleanup, include = FALSE--------------------------------------------
## restore settings
log_threshold(oldconf$threshold)
log_layout(oldconf$layout)
log_formatter(oldconf$formatter)
log_appender(oldconf$appender)

