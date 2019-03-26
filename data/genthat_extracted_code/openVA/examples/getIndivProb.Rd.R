library(openVA)


### Name: getIndivProb
### Title: Extract individual distribution of cause of death
### Aliases: getIndivProb

### ** Examples

data(RandomVA1)
# for illustration, only use interVA on 100 deaths
fit <- codeVA(RandomVA1[1:100, ], data.type = "WHO", model = "InterVA", 
                  version = "4.02", HIV = "h", Malaria = "l")
probs <- getIndivProb(fit)




