library(idar)


### Name: LF.gof
### Title: Loosmore and Ford Goodness of Fit Test
### Aliases: LF.gof
### Keywords: spatial

### ** Examples

# some envelopesfor some idar function
# The argument "savefuns" must be set to "TRUE"
# BEWARE: in real tests nsim shpuld be 199 or higher
data(lansing)
maple.lambda<- density(unmark(lansing[lansing$marks=="maple"]))
multi.maple.sim <- multifocalsimulator(lansing, "maple", nsim=10,
                               simulate=expression(rpoispp(maple.lambda)))

isar.maple.env<- envelope(lansing, fun=isar, mimark="maple", nsim=10,
                                     simulate=multi.maple.sim, r=seq(0.01, 0.25, le=100),
                                      savefuns=TRUE)
# Estimate GoF test
LF.gof(isar.maple.env)




