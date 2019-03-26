library(harmonicmeanp)


### Name: pharmonicmeanp
### Title: The (asymptotic) probability that a harmonic mean _p_-value (the
###   test statistic of the HMP procedure) has value less than or equal to
###   x.
### Aliases: pharmonicmeanp
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
pharmonicmeanp(x,length(p))
p.hmp(p)
p.mamml(1/p,2)



