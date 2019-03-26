library(barcode)


### Name: barcode
### Title: Barcode plots
### Aliases: barcode barcode.panel
### Keywords: multivariate

### ** Examples

# Simulate some data:
x <- list(Rounded.2=round(rnorm(500, 2, 1),2),
          SmallerLevel=c(rnorm(100), rnorm(100,4,1)),
          LargerBivariateRounded.4=round(c(rnorm(500), rnorm(500,3,1)),4))

barcode(x)
barcode(x, main="Different orientatation", horizontal=FALSE)

data(NewHavenResidential)
barcode(split(NewHavenResidential$dep, NewHavenResidential$zone),
        xlab="Percent Depreciation", 
        main=paste("New Haven Residential Depreciation by Residential Zone",
             "RS = Single Family, RM = Mixed Residential", sep = "\n"))




