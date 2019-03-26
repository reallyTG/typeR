library(CopulaCenR)


### Name: Kidney
### Title: Kidney
### Aliases: Kidney
### Keywords: datasets

### ** Examples

data(Kidney)
clayton_cox <- rc_spCox_copula(data = Kidney,
               var_list = c("age","sex","disease"),
               copula = "Clayton",
               method = "BFGS",
               B = 2)
summary(clayton_cox)



