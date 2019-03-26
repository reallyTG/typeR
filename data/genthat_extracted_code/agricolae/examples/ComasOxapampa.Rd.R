library(agricolae)


### Name: ComasOxapampa
### Title: Data AUDPC Comas - Oxapampa
### Aliases: ComasOxapampa
### Keywords: datasets

### ** Examples

library(agricolae)
data(ComasOxapampa)
# Oxapampa (10 35 31 S latitude, 75 23 0 E longitude, 1813 m.a.s.l )
# Comas, Mariscal Castilla (11  42  54  S latitude, 75 04 45 E longitude, 2800 m.a.s.l,)
# cultivars LBr-40 (resistant), Cruza 148 (moderately resistant) and Pimpernell (susceptible)
str(ComasOxapampa)
means <- tapply.stat(ComasOxapampa[,3:4],ComasOxapampa$cultivar,mean)
correlation(means$comas,means$oxapampa, method="kendall")



