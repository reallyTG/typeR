library(lgr)


### Name: print.LogEvent
### Title: Print or Format Logging Data
### Aliases: print.LogEvent format.LogEvent

### ** Examples

# standard fields can be printed using special tokens
x <- LogEvent$new(
  level = 300, msg = "a test event", caller = "testfun()", logger = lgr
)
print(x)
print(x, fmt = c("%t (%p) %c: %n - %m"))
print(x, colors = NULL)

# custom values
y <- LogEvent$new(
  level = 300, msg = "a gps track", logger = lgr,
  waypoints = 10, location = "Austria"
)

# default output with %f
print(y)

# proper JSON output with %j
if (requireNamespace("jsonlite")){
print(y, fmt = "%L [%t] %m  %j")
}




