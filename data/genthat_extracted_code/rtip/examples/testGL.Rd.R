library(rtip)


### Name: testGL
### Title: Test for Lorenz and Generalized Lorenz dominance
### Aliases: testGL

### ** Examples

data(eusilc2)
ATdataset1 <- setupDataset(eusilc2, country = "AT", region = "Burgenland")
ATdataset2 <- setupDataset(eusilc2, country = "AT", region = "Carinthia")
testGL(ATdataset1, ATdataset2, generalized = TRUE, samplesize = 10, alpha = 0.05)




