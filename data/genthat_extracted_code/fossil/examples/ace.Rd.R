library(fossil)


### Name: ACE
### Title: Abundance- and Incidence-based Coverage Estimators
### Aliases: ACE ICE
### Keywords: manip

### ** Examples

## sample vector
a<-c(0,5,1,1,2,0,0,1,0,0,8,45)
ACE(a)


## matrix format
a<-matrix(c(0,5,1,1,2,0,0,1,0,0,8,45),4,3)
ACE(a)
ICE(a)

## presence absence matrix
a<-matrix(c(0,1,1,1,1,0,0,1,0,0,1,1),4,3)
ACE(a)
ICE(a)




