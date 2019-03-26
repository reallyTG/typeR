library(CopulaCenR)


### Name: ACTG181
### Title: ACTG181
### Aliases: ACTG181
### Keywords: datasets

### ** Examples

data(ACTG181)
clayton_sp <- ic_spTran_copula(data = ACTG181,
                           copula = "Clayton",
                           l = 0, u = 25,
                           r = 3, m = 3,
                           var_list = "x")
summary(clayton_sp)



