library(GerminaR)


### Name: ger_intime
### Title: Cumulative sum of germination by period of time for line graphic
### Aliases: ger_intime

### ** Examples


library(GerminaR)
dt <- prosopis
grt <- ger_intime(Factor = "nacl", SeedN = "seeds", 
                  evalName = "D", method = "percentage", data = dt)
head(grt, 10)



