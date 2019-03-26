require(optimx)
ssqb.f<-function(x){
  nn<-length(x)
  yy <- 1:nn
  f<-sum((yy-x)^2)
  f
}
ssqb.g <- function(x){
  nn<-length(x)
  yy<-1:nn
  gg<- 2*(x - yy)
}
ssqb.h <- function(x){
  nn<-length(x)
  hh<- 2*diag(nn)
}
xx <- rep(pi, 4)
all4b <- opm(xx, ssqb.f, ssqb.g, hess=ssqb.h, method="ALL")
summary(all4b, order=value)

all4bx <- optimx(xx, ssqb.f, ssqb.g, control=list(all.methods=TRUE))
summary(all4bx, order=value)

cat("\n\nShow structure differences in solution of opm and optimx\n\n")
str(all4b)
str(all4bx)
