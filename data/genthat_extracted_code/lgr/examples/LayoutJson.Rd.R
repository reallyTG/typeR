library(lgr)


### Name: LayoutJson
### Title: Format LogEvents as JSON
### Aliases: LayoutJson

### ** Examples

# setup a dummy LogEvent

event <- LogEvent$new(
  logger = Logger$new("dummy logger"),
  level = 200,
  timestamp = Sys.time(),
  caller = NA_character_,
  msg = "a test message",
  custom_field = "LayoutJson can handle arbitrary fields"
)

# Default settings show all event fals
lo <- LayoutJson$new()
lo$format_event(event)




