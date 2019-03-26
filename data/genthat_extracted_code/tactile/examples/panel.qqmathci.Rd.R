library(tactile)


### Name: panel.qqmathci
### Title: Q-Q Diagram Confidence Intervals Panels
### Aliases: panel.qqmathci

### ** Examples

qqmath(~ height | voice.part, aspect = "xy", data = singer,
       prepanel = prepanel.qqmathline,
       panel = function(x, ...) {
         panel.qqmathci(x, ...)
         panel.qqmathline(x, ...)
         panel.qqmath(x, ...)
       })



