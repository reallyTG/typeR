library(Benchmarking)


### Name: dea.boot
### Title: Bootstrap DEA models
### Aliases: dea.boot boot.fear
### Keywords: efficiencies bootstrap

### ** Examples

x <- matrix(c(100,200,300,500,100,200,600),ncol=1)
y <- matrix(c(75,100,300,400,25,50,400),ncol=1)

e <- dea(x,y)
eff(e)

dea.plot.frontier(x,y,txt=TRUE)

#  To bootstrap for real, NREP should be at least 2000. Run the
#  following lines a couple of times with nrep=100 and see how the
#  bootstrap frontier changes from one run to the next. Try the same
#  with NREP=2000 even though is does take a longer time to run,
#  especially for dea.boot.
nrep <- 1
# nrep <- 2000

# if ( "FEAR" %in% .packages(TRUE) )  {
##  The following only works if the package FEAR is installed; it does
##  not have to be loaded.
#  b <- boot.fear(x,y, NREP=nrep)
# } else {
  b <- dea.boot(x,y, NREP=nrep)
# }

#  bias corrected frontier
dea.plot.frontier(b$eff.bc*x, y, add=TRUE, lty="dashed")
#  outer 95% confidence interval frontier for uncorrected frontier
dea.plot.frontier((b$conf.int[,1]+b$bias)*x, y, add=TRUE, lty="dotted")


## Test of hypothesis in DEA model
# Null hypothesis is that technology is CRS and the alternative is VRS
# Bogetoft and Otto (2011) pages 183--185.
ec <- dea(x,y, RTS="crs")
Ec <- eff(ec)
ev <- dea(x,y, RTS="vrs")
Ev <- eff(ev)
# The test statistic; equation (6.1)
S <- sum(Ec)/sum(Ev)

# To calculate CRS and VRS efficiencies in the same bootstrap replicas
# we reset the random number generator before each call of the
# function dea.boot.

# To get the an initial value for the random number generating process
# we save its state (seed)
save.seed <- sample.int(1e9,1)

# The bootstrap and calculate CRS and VRS under the assumption that
# the true technology is CRS (the null hypothesis) and such that the
# results correponds to the case where CRS and VRS are calculated for
# the same reference set of firms; to make this happen we set the
# random number generator to the same state before the calls.
set.seed(save.seed)
bc <- dea.boot(x,y, nrep,, RTS="crs")
set.seed(save.seed)
bv <- dea.boot(x,y, nrep,, RTS="vrs", XREF=x,YREF=y, EREF=ec$eff)

# Calculate the statistic for each bootstrap replica
bs <- colSums(bc$boot)/colSums(bv$boot)
# The critical value for the test (default size \code{alpha} of test is 5%)
critValue(bs, alpha=.1)
S
# Accept the hypothesis at 10% level?
critValue(bs, alpha=.1) <= S

# The probability of observering a smaller value of S when the
# hypothesis is true; the p--value.
typeIerror(S, bs)
# Accept the hypothesis at size level 10%?
typeIerror(S, bs) >= .10



