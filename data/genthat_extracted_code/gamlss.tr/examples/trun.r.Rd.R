library(gamlss.tr)


### Name: trun.r
### Title: Generates Random Values from a Truncated Density Function of a
###   gamlss.family Distribution
### Aliases: trun.r
### Keywords: distribution regression

### ** Examples

# trucated r function
# continuous
#----------------------------------------------------------------------------------------
# left
test1<-trun.r(par=c(0), family="TF", type="left")
rr<-test1(1000)
hist(rr)
#----------------------------------------------------------------------------------------
# right
test2 <- trun.r(par=c(10), family="BCT", type="right")
rr<-test2(1000)
hist(rr)
#----------------------------------------------------------------------------------------
# both
test3<-trun.r(par=c(-3,3), family="TF", type="both")
rr<-test3(1000)
hist(rr)
#----------------------------------------------------------------------------------------
# discrete 
# trucated r function
# left
test4<-trun.r(par=c(0), family="PO", type="left")
tN <- table(Ni <- test4(1000))
r <- barplot(tN, col='lightblue')
#----------------------------------------------------------------------------------------
# right
test5 <- trun.r(par=c(10), family="NBI", type="right")
tN <- table(Ni <- test5(1000))
r <- barplot(tN, col='lightblue')
tN <- table(Ni <- test5(1000,mu=5))
r <- barplot(tN, col='lightblue')
tN <- table(Ni <- test5(1000,mu=10, sigma=.1))
r <- barplot(tN, col='lightblue')
#----------------------------------------------------------------------------------------
# both 
test6<-trun.r(par=c(0,10), family="NBI", type="both")
tN <- table(Ni <- test6(1000,mu=5))
r <- barplot(tN, col='lightblue')
#----------------------------------------------------------------------------------------
# varying = TRUE
#----------------------------------------------------------------------------------------
# continuous
#----------------------------------------------------------------------------------------
# left
test7<-trun.r(par=c(0,1,2), family="TF", type="left", varying=TRUE)
test7(3)

#----------------------------------------------------------------------------------------
# right
test8 <- trun.r(par=c(10,11,12), family="BCT", type="right", varying=TRUE)
test8(3)
#----------------------------------------------------------------------------------------
# both
test9<-trun.r(par=rbind(c(-3,3), c(-1,5), c(0,6)), , family="TF", type="both", varying=TRUE)
test9(3)
#----------------------------------------------------------------------------------------
# discrete 
# trucated r function
# left
test10<-trun.r(par=c(0,1,2), family="PO", type="left", varying=TRUE)
test10(3)
#----------------------------------------------------------------------------------------
# right
test11 <- trun.r(par=c(10,11,12), family="NBI", type="right", varying=TRUE)
test11(3)
test11(3, mu=10, sigma=.1)
#----------------------------------------------------------------------------------------
# both 
test12<-trun.r(par=rbind(c(0,10), c(1,11), c(2,12)), family="NBI", type="both", varying=TRUE)
test12(3,mu=5)



