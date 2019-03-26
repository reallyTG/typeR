library(simIReff)


### Name: effDisc-helper
### Title: Helper functions for discrete effectiveness distributions
### Aliases: effDisc-helper matchTol support

### ** Examples

support("rr")
support("rr", runLength = 10)
support("p@10")
support("p20")

(i <- matchTol(c(.1, .4, .41, .40001), support("p10")))
support("p10")[i]



