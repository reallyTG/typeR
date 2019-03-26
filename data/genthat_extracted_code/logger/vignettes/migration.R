## ----pkgchecks, echo = FALSE---------------------------------------------
## check if other logger packages are available and exit if not
for (pkg in c('futile.logger', 'logging')) {
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

## load the main package first
library(logger)

## ------------------------------------------------------------------------
library(futile.logger)

## ------------------------------------------------------------------------
library(logger)

## ------------------------------------------------------------------------
flog.info('hi there')
flog.warn('watch out')

## ------------------------------------------------------------------------
log_info('hi there')
log_warn('watch out')

## ------------------------------------------------------------------------
flog.layout(layout.json)
flog.info('hi again')

## ------------------------------------------------------------------------
log_layout(layout_json())
 
log_info('hi again')

## ----echo=FALSE, results='hide'------------------------------------------
flog.layout(layout.simple)
log_layout(layout_simple)

## ------------------------------------------------------------------------
flog.info('hi')
flog.info('hi %s', 84/2)
flog.info(paste('hi', 84/2))
flog.info(glue::glue('hi {84/2}'))

## ------------------------------------------------------------------------
log_info('hi')
log_info('hi {84/2}')
log_formatter(formatter_sprintf)
log_info('hi %s', 84/2)
log_formatter(formatter_paste)
log_info('hi', 84/2)

## ----echo=FALSE, results='hide'------------------------------------------
log_formatter(formatter_glue)

## ------------------------------------------------------------------------
t <- tempfile()
flog.appender(appender.file(t))
flog.appender(appender.tee(t))

## ------------------------------------------------------------------------
t <- tempfile()
log_appender(appender_file(t))
log_appender(appender_tee(t))

## ----echo=FALSE, results='hide'------------------------------------------
flog.appender(appender.console)
log_appender(appender_console)

## ------------------------------------------------------------------------
library(logger)
log_formatter(formatter_sprintf)
flog.trace <- log_trace
flog.debug <- log_debug
flog.info <- log_info
flog.warn <- log_warn
flog.error <- log_error

flog.info('Hello from logger in a futile.logger theme ...')
flog.warn('... where the default log message formatter is %s', 'sprintf')

## ------------------------------------------------------------------------
library(logging)
basicConfig()

## ------------------------------------------------------------------------
library(logger)
 

## ------------------------------------------------------------------------
loginfo('hi there')
logwarn('watch out')

## ------------------------------------------------------------------------
log_info('hi there')
log_warn('watch out')

## ------------------------------------------------------------------------
str(as.list(loglevels))

## ------------------------------------------------------------------------
levels <- mget(ls(
    envir = environment(logger), pattern = '^[A-Z]'),
    envir = environment(logger))
str(levels[order(-as.numeric(levels))], give.attr = FALSE)
 

## ------------------------------------------------------------------------
getLogger()[['handlers']]$basic.stdout$formatter

## ------------------------------------------------------------------------
log_layout()

## ------------------------------------------------------------------------
loginfo('hi')
loginfo('hi %s', 84/2)
loginfo(paste('hi', 84/2))
loginfo(glue::glue('hi {84/2}'))

## ------------------------------------------------------------------------
log_info('hi')
log_info('hi {84/2}')
log_formatter(formatter_sprintf)
log_info('hi %s', 84/2)
log_formatter(formatter_paste)
log_info('hi', 84/2)

## ------------------------------------------------------------------------
log_formatter(formatter_logging)
log_info('42')
log_info(42)
log_info(4+2)
log_info('foo %s', 'bar')
log_info(12, 1+1, 2 * 2)

## ----echo=FALSE, results='hide'------------------------------------------
log_formatter(formatter_glue)

## ------------------------------------------------------------------------
library(logger)
log_formatter(formatter_logging)
log_layout(layout_logging)
logdebug <- log_debug
loginfo <- log_info
logwarn <- log_warn
logerror <- log_error

loginfo('Hello from logger in a logging theme ...')
logwarn('... where the default log message formatter is %s', 'sprintf', namespace = 'foobar')

## ------------------------------------------------------------------------
library(log4r)
logger <- create.logger(logfile = stdout(), level = "INFO")

## ------------------------------------------------------------------------
library(logger)

## ------------------------------------------------------------------------
info(logger, 'hi there')
warn(logger, 'watch out')

## ------------------------------------------------------------------------
log_info('hi there')
log_warn('watch out')

## ----echo=FALSE, results='hide'------------------------------------------
detach('package:logger', unload = TRUE)
detach('package:futile.logger', unload = TRUE)
detach('package:logging', unload = TRUE)

