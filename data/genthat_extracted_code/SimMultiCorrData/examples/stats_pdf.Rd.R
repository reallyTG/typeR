library(SimMultiCorrData)


### Name: stats_pdf
### Title: Calculate Theoretical Statistics for a Valid Power Method PDF
### Aliases: stats_pdf
### Keywords: statistics theoretical,

### ** Examples

stats_pdf(c = c(0, 1, 0, 0, 0, 0), method = "Polynomial", alpha = 0.025)

## Not run: 
##D # Beta(a = 4, b = 2) Distribution:
##D con <- find_constants(method = "Polynomial", skews = -0.467707,
##D                       skurts = -0.375, fifths = 1.403122,
##D                       sixths = -0.426136)$constants
##D stats_pdf(c = con, method = "Polynomial", alpha = 0.025)
## End(Not run)



