library(forestmangr)


### Name: pow
### Title: Raise a numeric vector to a given power
### Aliases: pow

### ** Examples

library(forestmangr)
data("exfm15")
head(exfm15)

# Raise a numeric vector to the power of 2:
pow(iris$Petal.Length, 2)

# Fit a model that contains the dbh squared, without the need to create a new variable:
lm(log(TH) ~ DBH + pow(DBH,2), exfm15 )
# or 
lm_table(exfm15, log(TH) ~ DBH + pow(DBH,2) )




