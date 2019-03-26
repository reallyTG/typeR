library(RTest)


### Name: htmlify_string
### Title: function to make strings xml and html compatible
### Aliases: htmlify_string

### ** Examples


input_string <- "<5"

stopifnot(htmlify_string(input_string)=="&lt;5")




