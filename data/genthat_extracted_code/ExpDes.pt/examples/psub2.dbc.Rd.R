library(ExpDes.pt)


### Name: psub2.dbc
### Title: Parcelas subdivididas em DBC
### Aliases: psub2.dbc

### ** Examples

data(ex)
attach(ex)
psub2.dbc(trat, dose, rep, resp, quali = c(TRUE, FALSE), mcomp = "tukey", 
 fac.names = c("Tratamento", "Dose"), sigT = 0.05, sigF = 0.05)



