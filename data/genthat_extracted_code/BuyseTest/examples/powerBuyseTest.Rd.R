library(BuyseTest)


### Name: powerBuyseTest
### Title: Performing simulation studies with BuyseTest
### Aliases: powerBuyseTest

### ** Examples


## using simBuyseTest
powerBuyseTest(sim = simBuyseTest, sample.size = c(100), n.rep = 2,
              formula = Treatment ~ tte(eventtime, censoring = status),
              method.inference = "asymptotic", trace = 4)

## using user defined simulation function
simFCT <- function(n.C, n.T){
    out <- data.table(Y=rnorm(n.C+n.T),
                      T=c(rep(1,n.C),rep(0,n.T))
                     )
return(out)
}

powerBuyseTest(sim = simFCT, sample.size = c(100), n.rep = 2,
              formula = T ~ cont(Y), method.inference = "asymptotic", trace = 4)




