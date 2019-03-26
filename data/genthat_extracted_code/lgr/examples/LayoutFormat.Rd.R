library(lgr)


### Name: LayoutFormat
### Title: Format Log Events as Text
### Aliases: LayoutFormat

### ** Examples

# setup a dummy LogEvent
event <- LogEvent$new(
  logger = Logger$new("dummy logger"),
  level = 200,
  timestamp = Sys.time(),
  caller = NA_character_,
  msg = "a test message"
)
lo <- LayoutFormat$new()
lo$format_event(event)




