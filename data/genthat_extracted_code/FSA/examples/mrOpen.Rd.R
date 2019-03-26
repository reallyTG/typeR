library(FSA)


### Name: jolly
### Title: Jolly-Seber analysis from multiple mark-recapture events from an
###   open population.
### Aliases: jolly mrOpen summary.mrOpen confint.mrOpen
### Keywords: manip

### ** Examples

## First example -- capture histories summarized with capHistSum()
ch1 <- capHistSum(CutthroatAL,cols2use=-1)  # ignore first column of fish ID
ex1 <- mrOpen(ch1)
summary(ex1)
summary(ex1,verbose=TRUE)
summary(ex1,parm="N")
summary(ex1,parm=c("N","phi"))
confint(ex1)
confint(ex1,parm="N")
confint(ex1,parm=c("N","phi"))
confint(ex1,verbose=TRUE)

## Second example - Jolly's data -- summarized data entered "by hand"
s1 <- rep(NA,13)
s2 <- c(10,rep(NA,12))
s3 <- c(3,34,rep(NA,11))
s4 <- c(5,18,33,rep(NA,10))
s5 <- c(2,8,13,30,rep(NA,9))
s6 <- c(2,4,8,20,43,rep(NA,8))
s7 <- c(1,6,5,10,34,56,rep(NA,7))
s8 <- c(0,4,0,3,14,19,46,rep(NA,6))
s9 <- c(0,2,4,2,11,12,28,51,rep(NA,5))
s10 <- c(0,0,1,2,3,5,17,22,34,rep(NA,4))
s11 <- c(1,2,3,1,0,4,8,12,16,30,rep(NA,3))
s12 <- c(0,1,3,1,1,2,7,4,11,16,26,NA,NA)
s13 <- c(0,1,0,2,3,3,2,10,9,12,18,35,NA)
jolly.top <- cbind(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13)

n <- c(54,146,169,209,220,209,250,176,172,127,123,120,142)
R <- c(54,143,164,202,214,207,243,175,169,126,120,120,0)
m <- c(0,10,37,56,53,77,112,86,110,84,77,72,95)
u <- n-m
jolly.bot <- rbind(m,u,n,R)

ex2 <- mrOpen(jolly.top,jolly.bot)
summary(ex2,verbose=TRUE)
confint(ex2,verbose=TRUE)

ex3 <- mrOpen(jolly.top,jolly.bot,type="Manly")
summary(ex3,verbose=TRUE)
confint(ex3,verbose=TRUE)

## demonstrate use of jolly()
ex3a <- jolly(jolly.top,jolly.bot)




