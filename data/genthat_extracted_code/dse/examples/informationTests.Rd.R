library(dse)


### Name: informationTests
### Title: Tabulates selection criteria
### Aliases: informationTests
### Keywords: ts

### ** Examples

    data("eg1.DSE.data.diff", package="dse")
    model1 <- estVARXls(eg1.DSE.data.diff)
    model2 <- estVARXar(eg1.DSE.data.diff)
    informationTests(model1, model2)


