library(ThreeWay)


### Name: TV
### Title: TV data
### Aliases: TV
### Keywords: data array multivariate

### ** Examples

# to perform stability check and produce bootstrap confidence intervals 
# it is useful to permute the modes so that the A-mode refers to students
data(TV)
TVdata=TV[[1]]
labSCALE=TV[[2]]
labPROGRAM=TV[[3]]
labSTUDENT=TV[[4]]
TVdata <- permnew(TVdata, 16, 15, 30)
TVdata <- permnew(TVdata, 15, 30, 16)



