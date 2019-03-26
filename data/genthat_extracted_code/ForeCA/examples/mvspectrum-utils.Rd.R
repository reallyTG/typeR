library(ForeCA)


### Name: mvspectrum-utils
### Title: S3 methods for class 'mvspectrum'
### Aliases: mvspectrum-utils plot.mvspectrum
### Keywords: hplot manip

### ** Examples

# see examples in 'mvspectrum'

SS <- mvspectrum(diff(log(EuStockMarkets)) * 100, 
                 spectrum.control = list(method = "multitaper"))
plot(SS, log = FALSE)




