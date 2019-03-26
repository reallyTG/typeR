### R code from vignette source 'Guide_lagged.Rnw'

###################################################
### code chunk number 1: Guide_lagged.Rnw:19-21
###################################################
library("lagged")
pd <- packageDescription("lagged")


###################################################
### code chunk number 2: Guide_lagged.Rnw:57-60
###################################################
a1 <-  drop(acf(ldeaths)$acf)
la1 <- Lagged(a1)
la1


###################################################
### code chunk number 3: Guide_lagged.Rnw:68-70
###################################################
maxLag(la1)
length(la1)


###################################################
### code chunk number 4: Guide_lagged.Rnw:80-84
###################################################
la1[0]
la1[0:4]
la1[c(1,3,5)]
la1[]


###################################################
### code chunk number 5: Guide_lagged.Rnw:88-91
###################################################
la1a <- la1
la1a[] <- round(la1, 2)
la1a


###################################################
### code chunk number 6: Guide_lagged.Rnw:94-96
###################################################
la1b <- round(la1, 2)
all(la1a == la1b)


###################################################
### code chunk number 7: Guide_lagged.Rnw:107-120
###################################################
-la1a
+la1a

## Math group
abs(la1a)
sinpi(la1a)
sqrt(abs(la1a))

## Math2 group
round(la1a)
round(la1a, 2)
signif(la1a)
signif(la1a, 4)


###################################################
### code chunk number 8: Guide_lagged.Rnw:124-127
###################################################
c(Max = max(la1a), Min = min(la1a), Range = range(la1a))
c(Prod = prod(la1a), Sum = sum(la1a))
c(Any = any(la1a < 0), All = all(la1a >= 0))


###################################################
### code chunk number 9: Guide_lagged.Rnw:136-144
###################################################
2*la1a
la1a^2
la1a + la1a^2
la1a - la1a^2
la1a * la1a^2
la1a / la1a^2

la1a + 1:length(la1a)


###################################################
### code chunk number 10: Guide_lagged.Rnw:157-159
###################################################
acv2 <- acf(ts.union(mdeaths, fdeaths))
la2 <- Lagged(acv2)


###################################################
### code chunk number 11: Guide_lagged.Rnw:163-165
###################################################
la2[1]
acv2$acf[2, ,] # same


###################################################
### code chunk number 12: Guide_lagged.Rnw:170-178
###################################################
n <- length(mdeaths)
tmpcov <- sum((mdeaths - mean(mdeaths)) * (fdeaths - mean(fdeaths)) ) / n
msd <- sqrt(sum((mdeaths - mean(mdeaths))^2)/n)
fsd <- sqrt(sum((fdeaths - mean(fdeaths))^2)/n)
tmpcov1 <- sum((mdeaths - mean(mdeaths))[2:n] * (fdeaths - mean(fdeaths))[1:(n-1)] ) / n
tmpcov1 / (msd * fsd)
la2[[1]][1,2] == tmpcov1 / (msd * fsd) # FALSE, but:
la2[[1]][1,2] - tmpcov1 / (msd * fsd)  # only numerically different


###################################################
### code chunk number 13: Guide_lagged.Rnw:183-190
###################################################
la2[[1]][1,2] == acv2$acf[2, 1, 2] # TRUE

la2[0]
acv2[0]

la2[1]
acv2[1]


