library(TRAMPR)


### Name: plot.TRAMP
### Title: Plot a TRAMP Object
### Aliases: plot.TRAMP TRAMP.plotone
### Keywords: hplot

### ** Examples

data(demo.samples)
data(demo.knowns)
res <- TRAMP(demo.samples, demo.knowns)

plot(res, 101)
plot(res, 110)
plot(res, 117)

plot(res, 117, grouped=TRUE)

## Not run: 
##D # Create a PDF file with all matches:
##D pdf("all_matches.pdf")
##D plot(res)
##D dev.off()
## End(Not run)



