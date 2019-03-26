library(fossil)


### Name: int.chao
### Title: Internal function for chao estimators
### Aliases: int.chao
### Keywords: manip

### ** Examples

## create example data set
a<-c(4,5,1,1,2,0,0,1,3,0,8,45,23)
int.chao(a)

## a data set which would give NaN using classic (ie not bias corrected) version
a<-c(4,5,0,0,2,0,0,0,3,0,8,45,23)
int.chao(a)



