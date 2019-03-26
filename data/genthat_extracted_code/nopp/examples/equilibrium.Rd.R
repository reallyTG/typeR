library(nopp)


### Name: equilibrium
### Title: Nash Optimal Party Positions
### Aliases: equilibrium

### ** Examples

## Not run: 
##D data(italy2006)
##D 
##D str(italy2006)
##D italy2006[1:2,1:14]
##D 
##D election <- set.data(italy2006 , shape="wide", choice="vote",
##D varying=c(5:14), sep="_")
##D str(election)
##D 
##D m <- mlogit(vote~prox+partyID | gov_perf+sex+age+education, 
##D election, reflevel = "UL")
##D summary(m)
##D 
##D true.pos <- list(FI=7.59, UL=3.50, RC=1.95, AN=8.08, UDC=5.66)
##D true.votes <- list(FI=.24, UL=.40, RC=.10, AN=.18, UDC=.08)
##D # model 1: comparison against true votes and party positions
##D nash.eq <- equilibrium(model=m, data=election, pos=true.pos, 
##D  votes=true.votes)
##D nash.eq
##D 
##D par(mfrow=c(3,1))
##D plot(nash.eq)
##D par(mfrow=c(1,1))
##D 
##D # model 2: colation behaviours
##D coal1 <- list(FI=1, UL=2, RC=2, AN=1, UDC=1)
##D alpha1 <- list(FI=0.5, UL=0.5, RC=0.5, AN=0.5, UDC=0.5)
##D nash.eq <- equilibrium(model=m, data=election, coal=coal1, 
##D  alpha=alpha1)
##D nash.eq
##D 
##D # model 3: colation behaviours
##D coal1 <- list(FI=1, UL=2, RC=2, AN=1, UDC=1)
##D alpha1 <- list(FI=0.7, UL=0.8, RC=0.1, AN=0.5, UDC=0.9)
##D nash.eq <- equilibrium(model=m, data=election, coal=coal1, 
##D  alpha=alpha1)
##D nash.eq
##D 
##D # model 4: rivals tends to separate each other
##D nash.eq <- equilibrium(model=m, data=election, margin=list(FI="UL", UL="FI"))
##D nash.eq
##D 
##D # model 5: fixed position averaged with Nash equilibrium solution
##D nash.eq <- equilibrium(model=m, data=election, fixed=list(RC=1), gamma=0.2)
##D nash.eq
##D 
##D # model 6: rivals tends to separate each other with 
##D # fixed position averaged with Nash equilibrium solution
##D nash.eq <- equilibrium(model=m, data=election,  
##D margin=list(FI="UL", UL="FI"), fixed=list(RC=1), gamma=0.2)
##D nash.eq
##D 
##D # model 7: coalition and fixed position averaged with 
##D # Nash equilibrium solution
##D coal1 <- list(FI=1, UL=2, RC=2, AN=1, UDC=1)
##D alpha1 <- list(FI=0.7, UL=0.8, RC=0.5, AN=0.5, UDC=0.5)
##D nash.eq <- equilibrium(model=m, data=election,  coal=coal1, 
##D  alpha=alpha1, fixed=list(RC=1), gamma=0.2)
##D nash.eq
##D 
##D # model 8: Bootstrap analysis
##D set.seed(280715)
##D nash.eq <- equilibrium(model=m, data=election, boot=10)
##D nash.eq
##D 
##D # model 9: Monte Carlo simulation
##D set.seed(280715)
##D nash.eq <- equilibrium(model=m, data=election, MC=10)
##D nash.eq
## End(Not run)



