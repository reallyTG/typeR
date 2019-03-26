library(ACSWR)


### Name: sheishu
### Title: The Seishu Wine Study
### Aliases: sheishu
### Keywords: testing independence of subvectors

### ** Examples

data(sheishu)
noc <- c(2,3,3,2)
nov <- 10
v <- nrow(sheishu)-1
varsheishu <- var(sheishu)
s11 <- varsheishu[1:2,1:2]
s22 <- varsheishu[3:5,3:5]
s33 <- varsheishu[6:8,6:8]
s44 <- varsheishu[9:10,9:10]
u <- det(varsheishu)/(det(s11)*det(s22)*det(s33)*det(s44))
a2 <- nov^2 - sum(noc^2)
a3 <- nov^3 - sum(noc^3)
f <- a2/2
cc <- 1 - (2*a3 + 3*a2)/(12*f*v)
u1 <- -v*cc*log(u)
u; a2; a3; f; cc; u1
qchisq(1-0.001,37)



