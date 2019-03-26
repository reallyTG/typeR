library(CopulaCenR)


### Name: DRS
### Title: DRS
### Aliases: DRS
### Keywords: datasets

### ** Examples

data(DRS)
clayton_wb <- rc_par_copula(data = DRS,
              var_list = "treat",
              copula = "Clayton",
              m.dist = "Weibull")
summary(clayton_wb)



