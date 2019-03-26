library(metasens)


### Name: orbbound
### Title: Sensitivity Analysis for Outcome Reporting Bias (ORB)
### Aliases: orbbound

### ** Examples

data(Fleiss93, package="meta")

meta1 <- metabin(event.e, n.e, event.c, n.c,
                 data=Fleiss93, sm="OR")

orb1 <- orbbound(meta1, k.suspect=1:5)
print(orb1, digits=2)
forest(orb1, xlim=c(0.75, 1.5))

# Same result
orb2 <- orbbound(meta1, k.suspect=1:5, left=FALSE)
print(orb2, digits=2)

# Assuming bias in other direction
orb3 <- orbbound(meta1, k.suspect=1:5, left=TRUE)
print(orb3, digits=2)



