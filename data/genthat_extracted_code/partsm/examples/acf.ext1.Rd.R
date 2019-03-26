library(partsm)


### Name: acf.ext1
### Title: Autocorrelation function for several transformations of the
###   original data
### Aliases: acf.ext1
### Keywords: misc

### ** Examples

      ## Logarithms of the Real GNP in Germany
      data("gergnp")
      lgergnp <- log(gergnp, base=exp(1))

      out <- acf.ext1(wts=lgergnp, transf.type="orig",
                      type="correlation", lag.max=12, showcat=TRUE, plot=FALSE)

      out <- acf.ext1(wts=lgergnp, transf.type="perdiffsd", 
                      perdiff.coeff = c(1.004, 0.981, 1.047, 0.969),
                      type="correlation", lag.max=12, showcat=TRUE, plot=FALSE)
   


