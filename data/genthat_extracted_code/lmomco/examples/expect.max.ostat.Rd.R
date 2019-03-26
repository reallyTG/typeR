library(lmomco)


### Name: expect.max.ostat
### Title: Compute the Expectation of a Maximum (or Minimum and others)
###   Order Statistic
### Aliases: expect.max.ostat expect.min.ostat eostat
### Keywords: order statistics (misc.)

### ** Examples

para <- vec2par(c(10,100), type="nor")
n <- 12
# The three outputted values from should be similar:
# (1) theoretical, (2) theoretical, and (3) simulation
expect.max.ostat(n, para=para, cdf=cdfnor, pdf=pdfnor)
expect.max.ostat(n, para=para, qua=quanor)
mean(sapply(1:1000, function(x) { max(rlmomco(n,para))}))

eostat(8, j=5, qua=quagum, para=vec2par(c(1670,1000), type="gum"))
## Not run: 
##D para <- vec2par(c(1280, 800), type="nor")
##D expect.max.ostat(10, j=9, para, qua=quanor)
##D [1] 2081.086      # SUCCESS ---------------------------
##D expect.max.ostat(10, j=9, para, pdf=pdfnor, cdf=cdfnor,
##D                                 lower=-1E3, upper=1E6)
##D [1] 1.662701e-06  # FAILURE ---------------------------
##D expect.max.ostat(10, j=9, para, pdf=pdfnor, cdf=cdfnor,
##D                                 lower=-1E3, upper=1E5)
##D [1] 2081.086      # SUCCESS ---------------------------
## End(Not run)



