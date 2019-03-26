library(compositions)


### Name: pairwiseplot
### Title: Creates a paneled plot like pairs for two different datasets.
### Aliases: pairwisePlot pairwisePlot.default
### Keywords: hplot

### ** Examples


X <- rnorm(100)
Y <- rnorm.acomp(100,acomp(c(A=1,B=1,C=1)),0.1*diag(3))+acomp(t(outer(c(0.2,0.3,0.4),X,"^")))

pairs(cbind(ilr(Y),X),panel=function(x,y,...) {points(x,y,...);abline(lm(y~x))})
pairs(cbind(balance(Y,~A/B/C),X),
         panel=function(x,y,...) {points(x,y,...);abline(lm(y~x))})
pairwisePlot(balance(Y,~A/B/C),X)
pairwisePlot(X,balance(Y,~A/B/C),
         panel=function(x,y,...) {plot(x,y,...);abline(lm(y~x))})
pairwisePlot(X,balance01(Y,~A/B/C))

# A function to extract a portion representation of subcompsitions
# with two elements:
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

pairwisePlot(X,subComps(Y,A~B,A~C,B~C))

## using Hydrochemical data set as illustration of mixed possibilities
data(Hydrochem)
xc = acomp(Hydrochem[,c("Ca","Mg","Na","K")])
fk = Hydrochem$River
pH = -log10(Hydrochem$H)
covars = data.frame(pH, River=fk)
pairwisePlot(clr(xc), pH)
pairwisePlot(clr(xc), pH, col=fk)
pairwisePlot(pH, ilr(xc), add.line=TRUE)
pairwisePlot(covars, ilr(xc), add.line=TRUE, line.col="magenta")
pairwisePlot(clr(xc), covars, add.robust=TRUE)




