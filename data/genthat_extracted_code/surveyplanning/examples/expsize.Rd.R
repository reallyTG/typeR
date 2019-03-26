library(surveyplanning)


### Name: expsize
### Title: Sample size calculation
### Aliases: expsize
### Keywords: surveyplanning

### ** Examples


data <- data.table(H=1:3, Yh=10*1:3, Yh1=10*4:6,
                   s2h=10*runif(3), s2h2=10*runif(3),
                   CVh=rep(4.9, 3),
                   poph=8*1:3, Rh=rep(1,3),
                   deffh=rep(2,3), deffh2=rep(3,3))

size <- expsize(Yh=c("Yh", "Yh1"), H="H",
                s2h=c("s2h", "s2h2"), poph="poph",
                Rh="Rh", deffh=c("deffh", "deffh2"),
                CVh="CVh", dataset = data)
size



