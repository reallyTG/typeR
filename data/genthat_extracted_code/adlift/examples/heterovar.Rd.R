library(adlift)


### Name: heterovar
### Title: heterovar
### Aliases: heterovar
### Keywords: arith

### ** Examples

x1<-runif(256)
#
y1<-make.signal2("doppler",x=x1)
#
fwd<-fwtnp(x1,y1,LocalPred=AdaptNeigh,neighbours=2)
#
y<-fwd$lengthsremove
rem<-fwd$removelist
al<-artlev(y,rem)
#
yrem<-x1[sort(rem)]
detail<-fwd$coeff[sort(rem)]
#
h<-heterovar(yrem,detail,al)
#
h$varvec[1:10]
#
#the first ten coefficient variances to be used in the normalisation of the detail 
#coefficients



