library(nopp)


### Name: plot.nash.eq
### Title: Plot function for Nash equilibrium object
### Aliases: plot.nash.eq

### ** Examples

## Not run: 
##D data(italy2006)
##D election <- set.data(italy2006 , shape="wide", choice="vote", varying=c(5:14), sep="_")
##D m <- mlogit(vote~prox+partyID | gov_perf+sex+age+education, election, reflevel = "UL")
##D 
##D true.pos <- list(FI=7.59, UL=3.50, RC=1.95, AN=8.08, UDC=5.66)
##D true.votes <- list(FI=.24, UL=.40, RC=.10, AN=.18, UDC=.08)
##D 
##D # comparison against true votes and party positions
##D nash.eq <- equilibrium(model=m, data=election, pos=true.pos, votes=true.votes)
##D nash.eq
##D par(mfrow=c(3,1))
##D plot(nash.eq)
##D 
##D 
##D 
##D # bootstrap confidence intervals
##D nash.eq <- equilibrium(model=m, data=election, boot=10)
##D nash.eq
##D plot(nash.eq)
##D 
##D par(mfrow=c(1,1))
## End(Not run)



