library(copBasic)


### Name: lcomCOPpv
### Title: Simulating the Sample Distribution(s) of L-correlation,
###   L-coskew, and L-cokurtosis for a Copula
### Aliases: lcomCOPpv
### Keywords: inference hypothesis testing copula (characteristics) copula
###   (inference) L-comoments

### ** Examples

# See Note section of vuongCOP() for an extended discussion of copula inference
## Not run: 
##D Tau <- 0.6410811; para <- GHcop(tau=Tau)$para # This Tau is from a situation of
##D # two river tributaries. These three L-comoments with univariate L-moments on the
##D T2 <- c(1,  0.79908960, 0.79908960, 1) # diagonals are derived from those river
##D # tributaries and downstream of the junction data.
##D T3 <- c(0, -0.04999318, 0.07689082, 0)
##D T4 <- c(0,  0.01773833, 0.04756257, 0) # Is the Ho:GHcop rejectable?
##D LCOM <- list(T2=matrix(T2, nrow=2), T3=matrix(T3, nrow=2), T4=matrix(T4, nrow=2))
##D set.seed(30312)
##D ZZ1 <- lcomCOPpv(75, LCOM, cop=GHcop, para=para, repcoe=2000, usemcmu=FALSE)
##D print(ZZ1)
##D set.seed(30312)
##D ZZ2 <- lcomCOPpv(75, LCOM, cop=GHcop, para=para, repcoe=2000, usemcmu=TRUE)
##D print(ZZ2)
##D # The results here suggest that the GHcop is not rejectable.
## End(Not run)



