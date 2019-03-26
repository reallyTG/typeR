library(ecespa)


### Name: Kmulti.ls
### Title: Lotwick's and Silverman's combined estimator of the marked
###   K-function
### Aliases: Kmulti.ls
### Keywords: spatial

### ** Examples


data(amacrine)

plot(Kmulti.ls(amacrine, I=amacrine$marks=="on", J=amacrine$marks=="off", 
	 corre="isotropic"), sqrt(./pi)-r~r, main="")

# compare with Kmulti

plot(Kmulti(amacrine, I=amacrine$marks=="on", J=amacrine$marks=="off"),
         sqrt(iso/pi)-r~r, add=TRUE, col=3)

plot(Kmulti(amacrine, J=amacrine$marks=="on", I=amacrine$marks=="off"),
      sqrt(iso/pi)-r~r, add=TRUE, col=4)




