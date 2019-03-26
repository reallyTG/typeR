library(harmonicmeanp)


### Name: pLandau
### Title: The cumulative distribution function of a Landau distribution.
### Aliases: pLandau
### Keywords: ~hmp

### ** Examples

# For detailed examples type vignette("harmonicmeanp")
# Example: simulate from a non-uniform distribution mildly enriched for small \emph{p}-values. 
# Compare the significance of the combined p-value for Bonferroni, Benjamini-Hochberg (i.e. Simes), 
# HMP and (equivalently) MAMML with 2 degrees of freedom.
p = rbeta(1000,1/1.5,1)
min(p.adjust(p,"bonferroni"))
min(p.adjust(p,"BH"))
x = hmp.stat(p)
pLandau(1/x,log(length(p))+(1 + digamma(1) - log(2/pi)),pi/2,lower.tail=FALSE)
p.hmp(p)
p.mamml(1/p,2)



