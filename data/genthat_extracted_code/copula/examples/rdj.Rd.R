library(copula)


### Name: rdj
### Title: Daily Returns of Three Stocks in the Dow Jones
### Aliases: rdj
### Keywords: datasets

### ** Examples

data(rdj)
str(rdj)# 'Date' is of class "Date"

with(rdj, {
   matplot(Date, rdj[,-1], type = "o", xaxt = "n", ylim = .15* c(-1,1),
           main = paste("rdj - data;  n =", nrow(rdj)))
   Axis(Date, side=1)
})
legend("top", paste(1:3, names(rdj[,-1])), col=1:3, lty=1:3, bty="n")

## No test: 
x <- rdj[, -1] # '-1' : not the Date
## a t-copula (with a vague inital guess of Rho entries)
tCop <- tCopula(rep(.2, 3), dim=3, dispstr="un", df=10, df.fixed=TRUE)
ft <- fitCopula(tCop, data = pobs(x))
ft
ft@copula # the fitted t-copula as tCopula object
system.time(
g.C <- gofCopula(claytonCopula(dim=3), as.matrix(x), simulation = "mult")
) ## 5.3 sec
system.time(
g.t <- gofCopula(ft@copula, as.matrix(x), simulation = "mult")
) ## 8.1 sec

## End(No test)



