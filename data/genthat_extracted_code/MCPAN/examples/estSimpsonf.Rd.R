library(MCPAN)


### Name: estSimpsonf
### Title: Estimate the Simpson index from several samples
### Aliases: estSimpsonf
### Keywords: htest

### ** Examples


# Here, the estimates for the Hell Creek Dinosaur 
# example are compared to the estimates in 
# Tables 2 and 3 of Rogers and Hsu (2001).

data(HCD)
HCD

# Groupwise point estimates:

est<-estSimpsonf(X=HCD[,-1], f=HCD[,1])

est

# Table 2:


cmat<-rbind(
"lower-middle"=c(1,-1,0),
"lower-upper"=c(1, 0,-1),
"middle-upper"=c(0,1,-1))


# the point estimates:

# cmat %*% est$estimate
crossprod(t(cmat), est$estimate)


# the standard errors:
# sqrt(diag(cmat %*% diag(est$varest) %*% t(cmat)))

sqrt(diag(crossprod(t(cmat), crossprod(diag(est$varest), t(cmat)) ) ))


# Table 3:

cmat<-rbind(
"middle-lower"=c(-1,1,0),
"upper-lower"=c(-1,0,1))

# cmat %*% est$estimate
crossprod(t(cmat), est$estimate)


# sqrt(diag(cmat %*% diag(est$varest) %*% t(cmat)))

sqrt(diag(crossprod(t(cmat), crossprod(diag(est$varest), t(cmat)) ) ))

# Note, that the point estimates are exactly
# the same as in Rogers and Hsu (2001),
# but the variance estimates are not, whenever
# the Upper group is involved.





