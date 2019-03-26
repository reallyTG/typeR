library(sybil)


### Name: addReact,modelorg-method
### Title: Add/Change Reactions in a Model
### Aliases: addReact addReact,modelorg-method addReact,modelorg,ANY-method
### Keywords: manip

### ** Examples

data(Ec_core)

# add reaction A + 2 B <-> C to the model
modelNew <- addReact(Ec_core, id="newReact", met=c("A", "B", "C"),
						Scoef=c(-1, -2, 1), reversible=TRUE,
						lb=-1000, ub=1000, obj=0)

# view the new reaction
shrinkMatrix(modelNew, j="newReact")



