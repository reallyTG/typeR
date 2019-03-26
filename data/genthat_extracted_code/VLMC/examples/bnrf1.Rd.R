library(VLMC)


### Name: bnrf1
### Title: BNRF1 Gene DNA sequences: Epstein-Barr and Herpes
### Aliases: bnrf1EB bnrf1HV
### Keywords: datasets

### ** Examples

data(bnrf1)
bnrf1EB[1:500]
table(bnrf1EB)
table(bnrf1HV)
n <- length(bnrf1HV)
table(t = bnrf1HV[-1], "t-1" = bnrf1HV[-n])

plot(as.integer(bnrf1EB[1:500]), type = "b")
## Don't show: 
 ftable(table( t = bnrf1HV[-(1:2)],
              "t-1" = bnrf1HV[-c(1,n)],
              "t-2" = bnrf1HV[-c(n-1,n)]))
 lag.plot(jitter(as.ts(bnrf1HV)),lag = 4, pch = ".")
## End(Don't show)

## Simplistic gene matching:
percent.eq <- sapply(0:200,
           function(i) 100 * sum(bnrf1EB[(1+i):(n+i)] ==  bnrf1HV))/n
plot.ts(percent.eq)



