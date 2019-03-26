library(FitAR)


### Name: JarqueBeraTest
### Title: Jarque-Bera Normality Test
### Aliases: JarqueBeraTest
### Keywords: htest

### ** Examples

#some normal data
z<-rnorm(100)
JarqueBeraTest(z)
#some skewed data
z<-rexp(100)
JarqueBeraTest(z)
#some thick tailed data
z<-rt(100,5)
JarqueBeraTest(z)



