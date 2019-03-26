library(metasens)


### Name: print.orbbound
### Title: Print method for objects of class orbbound
### Aliases: print.orbbound
### Keywords: print

### ** Examples

data(Fleiss93, package="meta")

meta1 <- metabin(event.e, n.e, event.c, n.c,
                 data=Fleiss93, sm="OR")

orb1 <- orbbound(meta1, k.suspect=1:5)

print(orb1, digits=2)

#
# Print log odds ratios instead of odds ratios
#
print(orb1, digits=2, backtransf=FALSE)

#
# Assuming that studies are missing on the left side
#
orb1.missleft <- orbbound(meta1, k.suspect=1:5, left=TRUE)

orb1.missleft

meta2 <- metabin(event.e, n.e, event.c, n.c,
                 data=Fleiss93, sm="OR", method="Inverse")

orb2 <- orbbound(meta2, k.suspect=1:5)

print(orb2, digits=2)



