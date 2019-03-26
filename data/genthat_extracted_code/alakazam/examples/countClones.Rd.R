library(alakazam)


### Name: countClones
### Title: Tabulates clones sizes
### Aliases: countClones

### ** Examples

# Without copy numbers
clones <- countClones(ExampleDb, groups="SAMPLE")

# With copy numbers and multiple groups
clones <- countClones(ExampleDb, groups=c("SAMPLE", "ISOTYPE"), copy="DUPCOUNT")




