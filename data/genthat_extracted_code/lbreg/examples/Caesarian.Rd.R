library(lbreg)


### Name: Caesarian
### Title: Caesarian Infection Dataset
### Aliases: Caesarian
### Keywords: datasets

### ** Examples

data(Caesarian)
Caesarian
# no observations for case (RISK=0, NPLAN=1, ANTIB=1)
y = Caesarian[,1:2]
cbind(Caesarian[,3:5], total=rowSums(y))
colSums(y)



