library(HRQoL)


### Name: HRQoLplot
### Title: Spider plot of the dimensions of the Short Form-36 Health Survey
### Aliases: HRQoLplot
### Keywords: fmsb

### ** Examples

set.seed(5)
# We insert the columns in the order that has been determined:
n <- c(20,4,9,20,20,8,3,13)
k=3
p=runif(8,0,1)
phi <- runif(8,1,3)
dat <- data.frame(
  PF=rBB(k,n[1],p[1],phi[1]),
  RP=rBB(k,n[2],p[2],phi[2]),
  BP=rBB(k,n[3],p[3],phi[3]),
  GH=rBB(k,n[4],p[4],phi[4]),
  VT=rBB(k,n[5],p[5],phi[5]),
  SF=rBB(k,n[6],p[6],phi[6]),
  RE=rBB(k,n[7],p[7],phi[7]),
  MH=rBB(k,n[8],p[8],phi[8]))

rownames(dat) <- c("ID1", "ID2", "ID3")
HRQoLplot(dat,TRUE)



