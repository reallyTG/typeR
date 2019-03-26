library(psych)


### Name: ability
### Title: 16 ability items scored as correct or incorrect.
### Aliases: ability
### Keywords: datasets

### ** Examples

data(ability)
keys <- list(ICAR16=colnames(ability),reasoning =  cs(reason.4,reason.16,reason.17,reason.19),
  letters=cs(letter.7, letter.33,letter.34,letter.58, letter.7), 
  matrix=cs(matrix.45,matrix.46,matrix.47,matrix.55), 
  rotate=cs(rotate.3,rotate.4,rotate.6,rotate.8))
scoreOverlap(keys,ability)
#not run
# ability.irt <- irt.fa(ability)
# ability.scores <- score.irt(ability.irt,ability)



