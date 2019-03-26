library(markovchain)


### Name: probabilityatT
### Title: Calculating probability from a ctmc object
### Aliases: probabilityatT

### ** Examples

states <- c("a","b","c","d")
byRow <- TRUE
gen <- matrix(data = c(-1, 1/2, 1/2, 0, 1/4, -1/2, 0, 1/4, 1/6, 0, -1/3, 1/6, 0, 0, 0, 0),
nrow = 4,byrow = byRow, dimnames = list(states,states))
ctmc <- new("ctmc",states = states, byrow = byRow, generator = gen, name = "testctmc")
probabilityatT(ctmc,1,useRCpp = TRUE)




