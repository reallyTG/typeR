library(vcr)


### Name: vcr_logging
### Title: vcr log file setup
### Aliases: vcr_logging vcr_log_file vcr_log_info
### Keywords: internal

### ** Examples

# user workflow
vcr_configuration()
logfile <- file.path(tempdir(), "vcr.log")
vcr_configure(tempdir(), log = TRUE, log_opts = list(file = logfile))

readLines(logfile) # empty

# log messages
vcr_log_info("hello world!")
readLines(logfile)
vcr_log_info("foo bar")
readLines(logfile)
## many messages
vcr_log_info(c("brown cow", "blue horse"))
readLines(logfile)
vcr_log_info(c("brown cow", "blue horse", "green goat"))
readLines(logfile)

# standalone workflow
# set a file to log to
vcr_log_file((f <- tempfile()))
readLines(f) # empty

# log messages
vcr_log_info("hello world!")
readLines(logfile)
vcr_log_info("foo bar")
readLines(logfile)

# cleanup
unlink(f)
unlink(logfile)



