library(openVA)


### Name: plotVA
### Title: Plot top CSMF for a fitted model
### Aliases: plotVA

### ** Examples

## No test: 
data(RandomVA3)
test <- RandomVA3[1:200, ]
train <- RandomVA3[201:400, ]
fit1 <- codeVA(data = test, data.type = "customize", model = "InSilicoVA",
                    data.train = train, causes.train = "cause",
                    Nsim=1000, auto.length = FALSE)

fit2 <- codeVA(data = test, data.type = "customize", model = "InterVA",
               data.train = train, causes.train = "cause",
               version = "4.02", HIV = "h", Malaria = "l")

fit3 <- codeVA(data = test, data.type = "customize", model = "Tariff",
               data.train = train, causes.train = "cause", 
               nboot.sig = 100)

fit4 <- codeVA(data = test, data.type = "customize", model = "NBC",
               data.train = train, causes.train = "cause", known.nbc = TRUE)

plotVA(fit1)
plotVA(fit2)
plotVA(fit3)
plotVA(fit4)
## End(No test)



