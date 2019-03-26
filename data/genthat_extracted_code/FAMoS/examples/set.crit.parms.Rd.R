library(FAMoS)


### Name: set.crit.parms
### Title: Convert Critical and Swap Sets
### Aliases: set.crit.parms

### ** Examples

#set critical set and names
crits <- list(c("p1", "p2"), c("p5"))
par.names <- c("p1", "p2", "p3", "p4", "p5")
#convert the critical conditions
set.crit.parms(critical.parameters = crits, all.names = par.names)



