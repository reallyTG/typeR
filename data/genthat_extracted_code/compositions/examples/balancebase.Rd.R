library(compositions)


### Name: balance
### Title: Compute balances for a compositional dataset.
### Aliases: balanceBase balance01 balance01.acomp balance01.rcomp balance
###   balance.acomp balance.rcomp balance.aplus balance.rplus
###   balanceBase.acomp balanceBase.rcomp balanceBase.aplus
###   balanceBase.rplus
### Keywords: multivariate

### ** Examples

X <- rnorm(100)
Y <- rnorm.acomp(100,acomp(c(A=1,B=1,C=1)),0.1*diag(3))+acomp(t(outer(c(0.2,0.3,0.4),X,"^")))
colnames(Y) <- c("A","B","C")

subComps <- function(X,...,all=list(...)) {
  X <- oneOrDataset(X)
  nams <- sapply(all,function(x) paste(x[[2]],x[[3]],sep=","))
  val  <- sapply(all,function(x){
              a = X[,match(as.character(x[[2]]),colnames(X)) ]
              b = X[,match(as.character(x[[2]]),colnames(X)) ]
              c = X[,match(as.character(x[[3]]),colnames(X)) ] 
              return(a/(b+c))
             }) 
  colnames(val)<-nams
  val
}
pairs(cbind(ilr(Y),X),panel=function(x,y,...) {points(x,y,...);abline(lm(y~x))})
pairs(cbind(balance(Y,~A/B/C),X),panel=function(x,y,...) {points(x,y,...);abline(lm(y~x))})

pairwisePlot(balance(Y,~A/B/C),X)
pairwisePlot(X,balance(Y,~A/B/C),panel=function(x,y,...) {plot(x,y,...);abline(lm(y~x))})
pairwisePlot(X,balance01(Y,~A/B/C))
pairwisePlot(X,subComps(Y,A~B,A~C,B~C))



balance(rcomp(Y),~A/B/C)
balance(aplus(Y),~A/B/C)
balance(rplus(Y),~A/B/C)






