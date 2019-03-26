library(lgr)


### Name: simple_logging
### Title: Simple Logging
### Aliases: simple_logging FATAL ERROR WARN INFO DEBUG TRACE log_exception
###   threshold console_threshold add_appender remove_appender show_log
###   show_dt show_data

### ** Examples

FATAL("This is an important message about %s going wrong", "something")
DEBUG("Debug messages are hidden by default")
console_threshold("debug")  # you must use lower case names here
DEBUG("Unless we lower the threshold")

add_appender(AppenderConsole$new(), "second_console_appender")
FATAL("Multiple console appenders are a bad idea")
remove_appender("second_console_appender")
INFO("Good that we defined an appender name, so it's easy to remove")



