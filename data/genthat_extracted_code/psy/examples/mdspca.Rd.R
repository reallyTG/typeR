library(psy)


### Name: mdspca
### Title: Graphical representation of a correlation matrix using a
###   Principal Component Analysis
### Aliases: mdspca
### Keywords: multivariate

### ** Examples

data(sleep)

mdspca(sleep[,c(2:5,7:11)])
## three consistent groups of variables, paradoxical sleep (in other words: dream)
## is negatively correlated with danger

mdspca(sleep[,c(2:5,7:11)],supvar=sleep[,6],namesupvar="Total.sleep",supsubj=sleep[,1],namesupsubj="",cx=0.5)
## Total.sleep is here a supplementary variable since it is deduced
## from Paradoxical.sleep and Slow.wave.sleep
## The variable Species is displayed in the subject plane,
## Rabbit and Cow have a high level of danger



