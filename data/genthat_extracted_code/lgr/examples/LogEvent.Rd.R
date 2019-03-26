library(lgr)


### Name: LogEvent
### Title: Events - The Atomic Unit of Logging
### Aliases: LogEvent LogEvents

### ** Examples

l <- Logger$new("dummy logger", appenders = NULL)
l$error("foo bar")

# The last LogEvent produced by a Logger is stored in the last_event field
l$last_event  # formatted by default
l$last_event$values  # values stored in the event

# Also contains the Logger that created it as .logger
l$last_event$logger
# equivalent to
l$last_event$.logger$name

# This is really a reference to the complete Logger, so the following is
# possible (though nonsensical)
l$last_event$.logger$last_event$msg
identical(l, l$last_event$.logger)




