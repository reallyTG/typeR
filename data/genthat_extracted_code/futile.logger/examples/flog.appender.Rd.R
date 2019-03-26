library(futile.logger)


### Name: flog.appender
### Title: Manage appenders for loggers
### Aliases: appender.console appender.file appender.tee flog.appender
### Keywords: data

### ** Examples

## Not run: 
##D flog.appender(appender.console(), name='my.logger')
##D 
##D # Set an appender to the logger named 'my.package'. Any log operations from
##D # this package will now use this appender.
##D flog.appender(appender.file('my.package.out'), 'my.package')
## End(Not run)



