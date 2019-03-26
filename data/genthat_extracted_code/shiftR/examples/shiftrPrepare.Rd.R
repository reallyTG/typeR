library(shiftR)


### Name: shiftrPrepare
### Title: Prepare Data for Fast Circular Permutation Analysis
### Aliases: shiftrPrepareLeft shiftrPrepareRight

### ** Examples

### Number of features
nf = 1e6

### Generate left and right sets
lset = sample(c(0L,1L), size = nf, replace = TRUE)
rset = sample(c(0L,1L), size = nf, replace = TRUE)

# Prepare binary sets:
lbin = shiftrPrepareLeft(lset)
rbin = shiftrPrepareRight(rset)

### Check object sizes
# Notice asymetry in binary object sizes

object.size(lset)
object.size(rset)
object.size(lbin)
object.size(rbin)



