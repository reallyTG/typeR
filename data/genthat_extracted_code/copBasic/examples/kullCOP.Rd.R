library(copBasic)


### Name: kullCOP
### Title: Kullback-Leibler Divergence, Jeffrey's Divergence, and
###   Kullback-Leibler Sample Size
### Aliases: kullCOP kullCOPint
### Keywords: inference copula (inference) copula (density) Joe (2014)
###   Examples and Exercises Sobol sequence (Monte Carlo integration)

### ** Examples

# See another demonstration under the Note section of statTn().
## Not run: 
##D # Joe (2014, p. 237, table 5.2)
##D # The Gumbel-Hougaard copula and Plackett copula below each have a Kendall Tau of
##D # about 0.5. Joe (2014) lists in the table that Jeffrey divergence is about 0.110
##D # and the Kullback-Leibler sample size is 133. Joe (2014) does not list the
##D # parameters for either copula, just that Kendall Tau = 0.5.
##D KL <- kullCOP(cop1=GHcop, para1=2, cop2=PLACKETTcop, para2=11.40484)
##D # Reports Jeffrey divergence        =   0.1063858
##D #      Kullback-Leibler sample size = 136 (another run produces 131)
##D 
##D S <- replicate(20, kullCOP(cop1=GHcop, para1=2, cop2=PLACKETTcop,
##D                            para2=11.40484, verbose=FALSE)$KL.sample.size)
##D print(as.integer(c(mean(S), sd(S)))) # 134 plus/minus 5
##D 
##D # Joe (2014, p. 237, table 5.3)
##D # The Gumbel-Hougaard copula and Plackett copula below each have a Spearman Rho of
##D # about 0.5. Joe (2014) lists in the table that Jeffrey divergence is about 0.063
##D # and the Kullback-Leibler sample size is 210. Joe (2014) does not list the
##D # parameters for either copula, just that for Spearman Rho = 0.5.
##D KL <- kullCOP(cop1=GHcop, para1=1.541071, cop2=PLACKETTcop, para2=5.115658)
##D # Reports Jeffrey divergence        =   0.06381151
##D #      Kullback-Leibler sample size = 220 (another run produces 203)
##D 
##D S <- replicate(20, kullCOP(cop1=GHcop, para1=1.541071, cop2=PLACKETTcop,
##D                            para2=5.115658, verbose=FALSE)$KL.sample.size)
##D print(as.integer(c(mean(S), sd(S))))  # 220 plus/minus 16
##D 
##D # Joe (2014) likely did the numerical integrations using analytical solutions to the
##D # probability densities and not rectangular approximations as in densityCOP().
## End(Not run)

## Not run: 
##D # Compare Jeffery Divergence estimates as functions of sample size when computed
##D # using Sobol sequences or not---Sobol sequences have less sampling variability.
##D GHpar <- PApar <- 2 # Spearman Rho = 0.6822339
##D Ns <- as.integer(10^c(seq(2.0, 3.5,by=0.01), seq(3.6, 5,by=0.2)))
##D JDuni <- sapply(1:length(Ns), function(i) {
##D                   kullCOP(cop1=GHcop, para1=GHpar, verbose=FALSE,
##D                           cop2=PARETOcop, para2=PApar, n=Ns[i],
##D                           sobol=FALSE)$Jeffrey.divergence })
##D JDsob <- sapply(1:length(Ns), function(i) {
##D                   kullCOP(cop1=GHcop, para1=GHpar, verbose=FALSE,
##D                           cop2=PARETOcop, para2=PApar, n=Ns[i],
##D                           sobol=TRUE )$Jeffrey.divergence })
##D plot(Ns, JDuni, type="l", log="x", # black line, notice likely outliers too
##D      xlab="Sample Size", ylab="Jeffery Divergence")
##D lines(Ns, JDsob, col=2) # red line
##D print(c(mean(JDuni), sd(JDuni))) # [1] 0.05923462 0.01544651
##D print(c(mean(JDsob), sd(JDsob))) # [1] 0.05863623 0.01184879
##D # So we see a slightly smaller variation when the Sobol sequence is used. 
## End(Not run)



