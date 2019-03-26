library(lgr)


### Name: Logger
### Title: Loggers
### Aliases: Logger Loggers LoggerGlue

### ** Examples

# lgr::lgr is the root logger that is always available
lgr$info("Today is %s", Sys.Date() )
lgr$fatal("This is a serious error")

# You can create new loggers with Logger$new(). The following creates a
# logger that logs to a temporary file.
tf <- tempfile()
lg <- Logger$new("mylogger", appenders = AppenderFile$new(tf))

# The new logger passes the log message on to the appenders of its parent
# logger, which is by default the root logger. This is why the following
# writes not only the file 'tf', but also to the console.
lg$fatal("blubb")
readLines(tf)

# This logger's print() method depicts this relationship
lg2 <- Logger$new("child", parent = lg)
print(lg2)
print(lg2$ancestry)
print(lg2$full_name)

# use formatting strings and custom fields
tf2 <- tempfile()
lg$add_appender(AppenderFile$new(tf2, layout = LayoutJson$new()))
lg$info("Not all %s support custom fields", "appenders", type = "test")
cat(readLines(tf), sep = "\n")
cat(readLines(tf2), sep = "\n")

# The following works because if no unnamed `...` are present, msg is not
# passed through sprintf() (otherwise you would have to escape the "%")
lg$fatal("100%")

# LoggerGlue
lg <- LoggerGlue$new("glue")
lg$fatal("blah ", "fizz is set to: {fizz}", foo = "bar", fizz = "buzz")



