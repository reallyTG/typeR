library(harmonicmeanp)


### Name: p.hmp
### Title: Compute a combined _p_-value via the harmonic mean _p_-value
### Aliases: p.hmp
### Keywords: ~hmp

### ** Examples

# For detailed examples type vignette("harmonicmeanp")
# Example: simulate from a non-uniform distribution mildly enriched for small \emph{p}-values. 
# Compare the significance of the combined p-value for Bonferroni, Benjamini-Hochberg (i.e. Simes), 
# HMP and (equivalently) MAMML with 2 degrees of freedom.
p = rbeta(1000,1/1.5,1)
min(p.adjust(p,"bonferroni"))
min(p.adjust(p,"BH"))
p.hmp(p)
p.mamml(1/p,2)



