library(nopp)


### Name: set.data
### Title: Prepares data for Nash equilibrium
### Aliases: set.data

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
##D # model: comparison against true votes and party positions
##D nash.eq <- equilibrium(model=m, data=election, pos=true.pos, 
##D  votes=true.votes)
##D nash.eq
## End(Not run)



