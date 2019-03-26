library(TreeBUGS)


### Name: readEQN
### Title: Read multiTree files
### Aliases: readEQN

### ** Examples

# Example: Standard Two-High-Threshold Model (2HTM)
EQNfile <- system.file("MPTmodels/2htm.eqn",
                       package="TreeBUGS")
readEQN(file = EQNfile, paramOrder = TRUE)

# with equality constraint:
readEQN(file = EQNfile, restrictions = list("Dn=Do", "g=0.5"),
        paramOrder = TRUE)

# define MPT model directly within R
model <-
  "2-High Threshold Model (2HTM)
  old hit d
  old hit (1-d)*g
  old miss (1-d)*(1-g)
  new fa (1-d)*g
  new cr (1-d)*(1-g)
  new cr d"
readEQN(model, paramOrder=TRUE)



