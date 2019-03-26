library(mfp)


### Name: GBSG
### Title: German Breast Cancer Study Group
### Aliases: GBSG
### Keywords: datasets

### ** Examples

    data(GBSG)
    mfp(Surv(rfst, cens) ~ fp(age, df = 2, select = 0.05)
                 + fp(prm, df = 4, select = 0.05), family = cox, data = GBSG)




