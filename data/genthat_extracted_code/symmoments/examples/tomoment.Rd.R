library(symmoments)


### Name: toMoment
### Title: Converts a tree from Newick or matching to moment format
### Aliases: toMoment

### ** Examples

# create a Newick object
exam.Newick      <- "(((a,b),c),d);"
# convert to a moment L-matrix
exam.moment <- toMoment(exam.Newick)
# convert to matching object
exam.matching <- toMatching(exam.moment)
# convert back to moment object
backto.moment <- toMoment(exam.matching)



