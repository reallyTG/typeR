library(epanetReader)


### Name: read.msxrpt
### Title: Read msx results
### Aliases: read.msxrpt epanetmsx.rpt

### ** Examples

# path to example file included with this package
msr <- file.path( find.package("epanetReader"), "extdata","example.rpt") 

#read the results into R
x <- read.msxrpt(msr)
names(x)
summary(x)
plot(x)



