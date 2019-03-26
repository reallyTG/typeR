library(tcR)


### Name: vis.shared.clonotypes
### Title: Visualisation of shared clonotypes occurrences among
###   repertoires.
### Aliases: vis.shared.clonotypes

### ** Examples

## Not run: 
##D data(twb)
##D # Show shared nucleotide clonotypes of all possible pairs
##D # using the Read.proportion column
##D twb.sh <- shared.repertoire(twb, "n0rp")
##D vis.shared.clonotypes(twb.sh, .ncol = 4)
##D 
##D # Show shared amino acid + Vseg clonotypes of pairs
##D # including the Subj.A (the first one) using
##D # the Read.count column.
##D twb.sh <- shared.repertoire(twb, "avrc")
##D vis.shared.clonotypes(twb.sh, 1, NA, .ncol = 4)
##D # same, just another order of axis
##D vis.shared.clonotypes(twb.sh, NA, 1, .ncol = 4)
##D 
##D # Show shared nucleotide clonotypes of Subj.A (the first one)
##D # Subj.B (the second one) using the Read.proportion column.
##D twb.sh <- shared.repertoire(twb, "n0rp")
##D vis.shared.clonotypes(twb.sh, 1, 2)
##D 
##D # Show the same plot, but with much larget points.
##D vis.shared.clonotypes(twb.sh, 1, 2, .point.size.modif = 3)
## End(Not run)



