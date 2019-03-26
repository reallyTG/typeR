library(BSDA)


### Name: Bigten
### Title: Graduation rates for student athletes and nonathletes in the Big
###   Ten Conf.
### Aliases: Bigten
### Keywords: datasets

### ** Examples


boxplot(rate ~ status, data = subset(Bigten, year = "1993-1994"), 
horizontal = TRUE, main = "Graduation Rates 1993-1994")
with(data = Bigten,
     tapply(rate, list(year, status), mean)
)




