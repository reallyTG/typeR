library(ACA)


### Name: SDScan
### Title: This is the workhorse function of the ACA. It detects
###   significant change-points in serial data.
### Aliases: SDScan

### ** Examples

## No test: 
data <- system.file("extdata","soccer.data.txt", package = "ACA")
SDScan(namefi=data, xleg="Time", yleg="Goals per game", titl="Goals in 
England: 1888-2014", onecol="n", daty="n", gray="y")
## End(No test)

data <- system.file("extdata","amorese.data.txt", package = "ACA")
## No test: 
SDScan(namefi=data, xleg="Index", yleg="Value", titl="Change in 
a Gaussian Sequence (with trend)", onecol="n", daty="n", gray="y")
## End(No test)



