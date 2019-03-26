library(AHMbook)


### Name: simHDSg
### Title: Simulate data under HDS protocol with groups
### Aliases: simHDSg

### ** Examples

# Run with the default arguments and look at the structure of the output:
set.seed(123)
tmp <- simHDSg()
str(tmp)
head(tmp$data)

str(simHDSg(type = "line"))     # Defaults for line transect data
str(simHDSg(type = "point"))    # Defaults for point transect data
str(simHDSg(lambda.group = 5))  # Much larger groups
str(simHDSg(lambda.group = 5, alpha1 = 0)) # No effect of groups size on p



