library(actuar)


### Name: InverseParalogistic
### Title: The Inverse Paralogistic Distribution
### Aliases: InverseParalogistic dinvparalogis pinvparalogis qinvparalogis
###   rinvparalogis minvparalogis levinvparalogis
### Keywords: distribution

### ** Examples

exp(dinvparalogis(2, 3, 4, log = TRUE))
p <- (1:10)/10
pinvparalogis(qinvparalogis(p, 2, 3), 2, 3)

## first negative moment
minvparalogis(-1, 2, 2)

## case with 1 - order/shape > 0
levinvparalogis(10, 2, 2, order = 1)

## case with 1 - order/shape < 0
levinvparalogis(10, 2/3, 2, order = 1)



