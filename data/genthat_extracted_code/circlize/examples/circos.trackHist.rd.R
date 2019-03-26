library(circlize)


### Name: circos.trackHist
### Title: Draw histogram in cells among a whole track
### Aliases: circos.trackHist

### ** Examples

## Not run: 
##D x = rnorm(1600)
##D factors = sample(letters[1:16], 1600, replace = TRUE)
##D circos.initialize(factors = factors, x = x)
##D circos.trackHist(factors = factors, x = x, col = "#999999", 
##D   border = "#999999")
##D circos.trackHist(factors = factors, x = x, bin.size = 0.1, 
##D   col = "#999999", border = "#999999")
##D circos.trackHist(factors = factors, x = x, draw.density = TRUE, 
##D   col = "#999999", border = "#999999")
##D circos.clear()
## End(Not run)




