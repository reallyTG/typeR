library(truncgof)


### Name: dplot
### Title: Plot of the distribution functions
### Aliases: dplot
### Keywords: aplot

### ** Examples

xc <- rnorm(25)     # complete sample
xt <- xc[xc >= 0]   # left truncated sample

# df of the complete sample
dplot(xc, "pnorm", list(0,1), vertical = TRUE)

# df of the left truncated sample
dplot(xt, "pnorm", list(0,1), H = 0, vertical = TRUE)



