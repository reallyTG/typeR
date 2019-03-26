library(lgr)


### Name: AppenderConsole
### Title: Log to the Console
### Aliases: AppenderConsole

### ** Examples

# create a new logger with propagate = FALSE to prevent routing to the root
# logger. Please look at the section "Logger Hirarchies" in the package
# vignette for more info.
logger  <- Logger$new("testlogger", propagate = FALSE)

logger$add_appender(AppenderConsole$new())
logger$add_appender(AppenderConsole$new(
  layout = LayoutFormat$new("[%t] %c(): [%n] %m", colors = getOption("lgr.colors"))))

# Will output the message twice because we attached two console appenders
logger$warn("A test message")




