library(dMod)


### Name: subset.eqnlist
### Title: subset of an equation list
### Aliases: subset.eqnlist

### ** Examples

reactions <- data.frame(Description = c("Activation", "Deactivation"), 
                        Rate = c("act*A", "deact*pA"), A=c(-1,1), pA=c(1, -1) )
f <- as.eqnlist(reactions)
subset(f, "A" %in% Educt)
subset(f, "pA" %in% Product)
subset(f, grepl("act", Rate))



