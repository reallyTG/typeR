library(rtip)


### Name: testTIP
### Title: Test for TIP dominance
### Aliases: testTIP

### ** Examples

data(eusilc2)
ATdataset <- setupDataset(eusilc2, country = "AT")
ATdataset1 <- setupDataset(eusilc2, country = "AT", region = "Burgenland")
ATdataset2 <- setupDataset(eusilc2, country = "AT", region = "Carinthia")
testTIP(ATdataset1, ATdataset2, same.arpt.value = arpt(ATdataset), samplesize = 50, alpha = 0.05)




