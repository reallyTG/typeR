library(Hmisc)


### Name: wtd.stats
### Title: Weighted Statistical Estimates
### Aliases: wtd.mean wtd.var wtd.quantile wtd.Ecdf wtd.table wtd.rank
###   wtd.loess.noiter num.denom.setup
### Keywords: nonparametric category distribution robust loess smooth manip

### ** Examples

set.seed(1)
x <- runif(500)
wts <- sample(1:6, 500, TRUE)
std.dev <- sqrt(wtd.var(x, wts))
wtd.quantile(x, wts)
death <- sample(0:1, 500, TRUE)
plot(wtd.loess.noiter(x, death, wts, type='evaluate'))
describe(~x, weights=wts)
# describe uses wtd.mean, wtd.quantile, wtd.table
xg <- cut2(x,g=4)
table(xg)
wtd.table(xg, wts, type='table')

# Here is a method for getting stratified weighted means
y <- runif(500)
g <- function(y) wtd.mean(y[,1],y[,2])
summarize(cbind(y, wts), llist(xg), g, stat.name='y')

# Empirically determine how methods used by wtd.quantile match with
# methods used by quantile, when all weights are unity
set.seed(1)
u <-  eval(formals(wtd.quantile)$type)
v <- as.character(1:9)
r <- matrix(0, nrow=length(u), ncol=9, dimnames=list(u,v))

for(n in c(8, 13, 22, 29))
  {
    x <- rnorm(n)
    for(i in 1:5) {
      probs <- sort( runif(9))
      for(wtype in u) {
        wq <- wtd.quantile(x, type=wtype, weights=rep(1,length(x)), probs=probs)
        for(qtype in 1:9) {
          rq <- quantile(x, type=qtype, probs=probs)
          r[wtype, qtype] <- max(r[wtype,qtype], max(abs(wq-rq)))
        }
      }
    }
  }

r

# Restructure data to generate a dichotomous response variable
# from records containing numbers of events and numbers of trials
num   <- c(10,NA,20,0,15)   # data are 10/12 NA/999 20/20 0/25 15/35
denom <- c(12,999,20,25,35)
w     <- num.denom.setup(num, denom)
w
# attach(my.data.frame[w$subs,])



