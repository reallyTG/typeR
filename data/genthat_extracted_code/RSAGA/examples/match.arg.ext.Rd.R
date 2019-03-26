library(RSAGA)


### Name: match.arg.ext
### Title: Extended Argument Matching
### Aliases: match.arg.ext
### Keywords: utilities

### ** Examples

# Based on example from 'match.arg':
require(stats)
center <- function(x, type = c("mean", "median", "trimmed")) {
  type <- match.arg.ext(type,base=0)
  switch(type,
         mean = mean(x),
         median = median(x),
         trimmed = mean(x, trim = .1))
}
x <- rcauchy(10)
center(x, "t")       # Works
center(x, 2)         # Same, for base=0
center(x, "med")     # Works
center(x, 1)         # Same, for base=0
try(center(x, "m"))  # Error



