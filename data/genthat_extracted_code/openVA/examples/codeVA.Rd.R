library(openVA)


### Name: codeVA
### Title: Running automated method on VA data
### Aliases: codeVA
### Keywords: InSilicoVA InterVA4 NBC4VA Tariff

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

## End(No test)



