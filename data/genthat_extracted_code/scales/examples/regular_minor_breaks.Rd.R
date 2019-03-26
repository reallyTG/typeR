library(scales)


### Name: regular_minor_breaks
### Title: Minor breaks. Places minor breaks between major breaks.
### Aliases: regular_minor_breaks

### ** Examples

m <- extended_breaks()(c(1, 10))
regular_minor_breaks()(m, c(1, 10), n = 2)

n <- extended_breaks()(c(0, -9))
regular_minor_breaks(reverse = TRUE)(n, c(0, -9), n = 2)



