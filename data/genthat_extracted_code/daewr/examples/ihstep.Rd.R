library(daewr)


### Name: ihstep
### Title: This function performs Tukey's single degree of freedom test for
###   interaction in an unreplicated two-factor design
### Aliases: ihstep
### Keywords: htest

### ** Examples


library(daewr)
des <- DefScreen( m = 8 )
pd<-c(5.35,4.4,12.91,3.79,4.15,14.05,11.4,4.29,3.56,11.4,10.09,5.9,9.54,4.53,3.919,8.1,5.35)
trm<-ihstep(pd,des)




