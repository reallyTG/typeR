library(rex)


### Name: lookarounds
### Title: Lookarounds
### Aliases: lookarounds %if_next_is% %if_next_isnt% %if_prev_is%
###   %if_prev_isnt%

### ** Examples

stopifnot(grepl(rex("crab" %if_next_is% "apple"), "crabapple", perl = TRUE))
stopifnot(grepl(rex("crab" %if_prev_is% "apple"), "applecrab", perl = TRUE))
stopifnot(grepl(rex(range("a", "e") %if_next_isnt% range("f", "g")),
  "ah", perl = TRUE))
stopifnot(grepl(rex(range("a", "e") %if_next_is% range("f", "i")),
  "ah", perl = TRUE))



