library(lgr)


### Name: as.data.frame.LogEvent
### Title: Coerce LogEvents to Data Frames
### Aliases: as.data.frame.LogEvent as.data.table.LogEvent
###   as_tibble.LogEvent

### ** Examples

l <- Logger$new("test")
l$info("lorem ipsum")
as.data.frame(l$last_event)

l$info("rememver LogEvents can store any custom log values", df = iris)
as.data.frame(l$last_event)
head(as.data.frame(l$last_event)$df[[1]])




