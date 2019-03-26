library(DescTools)


### Name: WoolfTest
### Title: Woolf Test For Homogeneity in 2x2xk Tables
### Aliases: WoolfTest
### Keywords: htest

### ** Examples

migraine <- xtabs(freq ~ .,
            cbind(expand.grid(treatment=c("active","placebo"),
                               response=c("better","same"),
                               gender=c("female","male")),
                  freq=c(16,5,11,20,12,7,16,19))
            )

WoolfTest(migraine)



