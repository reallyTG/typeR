library(rtip)


### Name: tip
### Title: TIP curve
### Aliases: tip

### ** Examples

data(eusilc2)
ATdataset <- setupDataset(eusilc2, country = "AT")
tip.curve <- tip(ATdataset, arpt.value = arpt(ATdataset), norm = TRUE)
str(tip.curve)



