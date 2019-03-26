library(symmoments)


### Name: toNewick
### Title: convert representation of phylogenetic tree as a moment L-matrix
###   to Newick form
### Aliases: toNewick

### ** Examples

# create a Newick object
exam.Newick      <- "(((a,b),c),d);"
# convert to a moment L-matrix
exam.moment <- toMoment(exam.Newick)
# convert back to Newick format
backto.Newick <- toNewick(exam.moment)



