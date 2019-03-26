library(CopulaCenR)


### Name: AREDS
### Title: AREDS
### Aliases: AREDS
### Keywords: datasets

### ** Examples

data(AREDS)
copula2_sp <- ic_spTran_copula(data = AREDS,
              copula = "Copula2",
              var_list = c("ENROLLAGE",
                           "rs2284665",
                           "SevScaleBL"),
              l = 0, u = 15, m = 3, r = 3)
summary(copula2_sp)



