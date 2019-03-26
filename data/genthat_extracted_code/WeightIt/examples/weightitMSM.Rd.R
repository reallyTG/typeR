library(WeightIt)


### Name: weightitMSM
### Title: Generate Balancing Weights
### Aliases: weightitMSM print.weightitMSM

### ** Examples

library("twang"); library("cobalt")
data("iptwExWide")
(W <- weightitMSM(list(tx1 ~ age + gender + use0,
                      tx2 ~ tx1 + use1 + age + gender + use0,
                      tx3 ~ tx2 + use2 + tx1 + use1 + age + gender + use0),
                 data = iptwExWide,
                 method = "ps"))
summary(W)
bal.tab(W)

##Going from long to wide data
data("iptwExLong")
wide_data <- reshape(iptwExLong$covariates,    #long data
                     timevar = "time",         #time variable
                     v.names = c("use", "tx"), #time-varying
                     idvar = "ID",             #time-stable
                     direction = "wide",
                     sep = "")

(W2 <- weightitMSM(list(tx1 ~ age + gender + use1,
                      tx2 ~ tx1 + use2 + age + gender + use1,
                      tx3 ~ tx2 + use3 + tx1 + use2 + age +
                          gender + use1),
                 data = wide_data,
                 method = "ps"))
summary(W2)

all.equal(get.w(W), get.w(W2))



