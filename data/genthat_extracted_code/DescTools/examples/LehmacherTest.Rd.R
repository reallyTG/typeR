library(DescTools)


### Name: LehmacherTest
### Title: Lehmacher's Test for Marginal Homogenity
### Aliases: LehmacherTest print.mtest
### Keywords: htest

### ** Examples

x <- matrix(c(400,40,20,10, 
              50,300,60,20, 
              10,40,120,5, 
              5,90,50,80), nrow=4, byrow=TRUE)
              
LehmacherTest(x)



