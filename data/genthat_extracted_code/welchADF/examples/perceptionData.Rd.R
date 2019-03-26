library(welchADF)


### Name: perceptionData
### Title: Number of puzzles 42 students were able to solve
### Aliases: perceptionData
### Keywords: datasets

### ** Examples

omnibus_LSM <- welchADF.test(perceptionData, response = "y", between.s = "Group")
omnibus_trimmed <- update(omnibus_LSM, trimming = TRUE)
omnibus_trimmed_boot <- update(omnibus_trimmed, bootstrap = TRUE, seed = 12345, numsim_b = 600)
pairwise_LSM <- update(omnibus_LSM, effect = "Group", contrast = "all.pairwise")
pairwise_trimmed <- update(pairwise_LSM, trimming = TRUE, effect.size = TRUE)
pairwise_trimmed_boot <- update(pairwise_trimmed, bootstrap = TRUE, seed = 12345, numsim_b = 600)
summary(omnibus_LSM)
summary(pairwise_trimmed_boot, digits = 6) # digits defaults to max(4, getOption("digits"))



