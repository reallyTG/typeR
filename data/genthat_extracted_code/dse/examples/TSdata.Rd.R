library(dse)


### Name: TSdata
### Title: Construct TSdata time series object
### Aliases: TSdata TSdata.default TSdata.TSdata TSdata.TSestModel
###   is.TSdata as.TSdata
### Keywords: ts

### ** Examples

   rain  <- matrix(rnorm(86*17), 86,17)
   radar <- matrix(rnorm(86*5),  86,5)
   mydata <- TSdata(input=radar, output=rain)



