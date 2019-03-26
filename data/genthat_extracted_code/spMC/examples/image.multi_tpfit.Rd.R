library(spMC)


### Name: image.multi_tpfit
### Title: Images with Multidimensional Transiograms
### Aliases: image.multi_tpfit
### Keywords: spatial distribution hplot

### ** Examples
## No test: 
data(ACM)

# Estimate model parameter
x <- multi_tpfit(ACM$MAT5, ACM[, 1:3])

# Set short names for categories 3 and 4
names(x$prop)[3:4] <- c("Clay and Sand", "Gravel and Sand")

# Plot 2-D theoretical sections of
# a multidimensional transiogram
image(x, 40, max.dist=c(200,200,20), which.dire=2:3,
    mar = .7, col=rev(heat.colors(500)),
    breaks=0:500/500, nlevels = 5)
## End(No test)


