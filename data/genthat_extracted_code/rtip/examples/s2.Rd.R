library(rtip)


### Name: s2
### Title: Twice the area under the TIP curve
### Aliases: s2

### ** Examples

data(eusilc2)
ATdataset <- setupDataset(eusilc2, country = "AT")
s2(ATdataset,arpt.value = arpt(ATdataset), norm = TRUE)



