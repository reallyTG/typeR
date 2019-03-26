library(mergedblocks)


### Name: mergedblocks
### Title: Merged block randomization
### Aliases: mergedblocks

### ** Examples

#Randomize 20 patients, 1:1 allocation, with labels "0" and "1".
mergedblocks(20)

#Randomize 50 patients, 1:1 allocation with labels "treatment" and "placebo".
mergedblocks(100, labels = c("treatment", "placebo"))

#Randomize 100 patients, 1:2:2 allocation with labels "placebo",
#"treatment 1", and "treatment 2".
mergedblocks(100, c(1, 2, 2), c("placebo", "treatment 1", "treatment 2"))




