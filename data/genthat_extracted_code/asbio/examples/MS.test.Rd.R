library(asbio)


### Name: MS.test
### Title: Mack-Skillings test
### Aliases: MS.test
### Keywords: htest univar

### ** Examples

#data from Campbell and Pelletier (1962) 
Niacin0<-c(7.58,7.87,7.71,8.00,8.27,8,7.6,7.3,7.82,8.03,7.35,7.66)
Niacin4<-c(11.63,11.87,11.40,12.20,11.70,11.80,11.04,11.50,11.49,11.50,10.10,11.70)
Niacin8<-c(15.00,15.92,15.58,16.60,16.40,15.90,15.87,15.91,16.28,15.10,14.80,15.70)
Niacin<-cbind(Niacin0,Niacin4,Niacin8)
lab<-c(rep(1,3),rep(2,3),rep(3,3),rep(4,3))
MS.test(Niacin, lab, reps=3)



