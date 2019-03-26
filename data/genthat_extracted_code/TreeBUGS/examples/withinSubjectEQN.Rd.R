library(TreeBUGS)


### Name: withinSubjectEQN
### Title: Make Within-Subject EQN Files
### Aliases: withinSubjectEQN

### ** Examples

# Example: Standard Two-High-Threshold Model (2HTM)
EQNfile <- system.file("MPTmodels/2htm.eqn",
                       package="TreeBUGS")
withinSubjectEQN(EQNfile, c("high","low"), constant=c("g"))



