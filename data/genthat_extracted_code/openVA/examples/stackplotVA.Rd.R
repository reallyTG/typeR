library(openVA)


### Name: stackplotVA
### Title: plot grouped CSMF from a "insilico" object
### Aliases: stackplotVA

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

data(SampleCategory3)
stackplotVA(fit1, grouping = SampleCategory3, type ="dodge", 
            ylim = c(0, 1), title = "InSilicoVA")
stackplotVA(fit2, grouping = SampleCategory3, type = "dodge", 
            ylim = c(0, 1), title = "InterVA4.02")
stackplotVA(fit3, grouping = SampleCategory3, type = "dodge", 
            ylim = c(0, 1), title = "Tariff")
stackplotVA(fit4, grouping = SampleCategory3, type = "dodge", 
            ylim = c(0, 1), title = "NBC")
## End(No test)



