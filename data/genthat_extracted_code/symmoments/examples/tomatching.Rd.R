library(symmoments)


### Name: toMatching
### Title: Convert representation of a phylogenetic tree as a moment
###   L-matrix to matching form
### Aliases: toMatching

### ** Examples

# create a Newick object
exam.Newick      <- "(((a,b),c),d);"
# convert to a moment L-matrix
exam.moment <- toMoment(exam.Newick)
# convert to matching format
exam.matching <- toMatching(exam.moment)



