library(choiceDes)


### Name: dcm.design.cand
### Title: Optimal fractional factorial design
### Aliases: dcm.design.cand

### ** Examples

## generate full factorial candidate set
cand <- gen.factorial(c(3,3,4), factors="all")

## restrict the candidate set so that level 3 in the first factor 
## cannot occur with level 1 in the second factor
remove.rows <- which(cand[,1] == 3 & cand[,2] == 1)
cand.restr <- cand[-remove.rows,]

## generate the design from the restricted candidate set
## and check that no design rows violate the restriction
des <- dcm.design.cand(cand.restr, 10, 6, 2)
which(des$levels[,4] == 3 & des$levels[,5] == 1)



