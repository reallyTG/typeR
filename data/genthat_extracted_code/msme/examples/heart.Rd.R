library(msme)


### Name: heart
### Title: Heart surgery outcomes for Canadian patients
### Aliases: heart
### Keywords: datasets

### ** Examples

data(heart)

heart.nb <- irls(death ~ anterior + hcabg + factor(killip),
                 a = 0.0001,
                 offset = log(heart$cases),
                 family = "negBinomial", link = "log",
                 data = heart)




