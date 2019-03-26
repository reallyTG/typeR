library(ExpDes.pt)


### Name: fat2.ad.dbc
### Title: Fatorial duplo com um tratamento adicional em DBC
### Aliases: fat2.ad.dbc

### ** Examples

data(ex7)
attach(ex7)
data(est21Ad)
fat2.ad.dbc(periodo, nivel, bloco, est21, est21Ad, quali = c(TRUE, FALSE), mcomp = "tukey", 
 fac.names = c("Periodo", "Nivel"), sigT = 0.05, sigF = 0.05)



