library(pez)


### Name: generic.metrics
### Title: Calculate any metric(s) (and compare with null distributions)
### Aliases: .metric.null .ses generic.metrics generic.null

### ** Examples

#Setup data
data(laja)
data <- comparative.comm(invert.tree, river.sites, invert.traits)
#Calculate some metrics
generic.metrics(data, c(.mpd, .pse))
#Compare with a trait-based null model (trait.asm)
generic.null(data, c(.mpd, .pse), "trait.asm", permute=10, trait="fish.pref")
#...be patient when running large (e.g., 1000) sets of null simulations
#You can also do this in pieces, giving even more flexibility
observed <- generic.metrics(data, c(.mpd, .pse))
#null <- .metric.null(data, c(.mpd, .pse))
#ses <- .ses(observed, null)
#...this is how everything works within generic.null
#...and, as with everything in pez, all internal functions start with a "."



