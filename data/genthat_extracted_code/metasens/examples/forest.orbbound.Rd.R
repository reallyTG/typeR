library(metasens)


### Name: forest.orbbound
### Title: Forest plot for 'orbbound' object (bound for outcome reporting
###   bias)
### Aliases: forest.orbbound
### Keywords: hplot

### ** Examples

data(Fleiss93, package="meta")

meta1 <- metabin(event.e, n.e, event.c, n.c,
                 data=Fleiss93, sm="OR")

orb1 <- orbbound(meta1, k.suspect=1:5)

print(orb1, digits=2)

forest(orb1, xlim=c(0.7, 1.5))

## Not run: 
##D forest(orb1, backtransf=FALSE)
## End(Not run)



