library(welchADF)


### Name: womenStereotypeData
### Title: Students' scores (men and women) on an arithmetic test
### Aliases: womenStereotypeData
### Keywords: datasets

### ** Examples

omnibus_LSM <- welchADF.test(womenStereotypeData, response = "y", between.s =
  c("condition", "sex"), contrast = "omnibus", effect = "condition")
omnibus_trimmed <- update(omnibus_LSM, trimming = TRUE, effect = NULL) # unset value of "effect"
pairwise_LSM <- update(omnibus_LSM, contrast = "all.pairwise", effect = c("condition", "sex"))
pairwise_trimmed <- update(pairwise_LSM, trimming = TRUE)
pairwise_trimmed_boot <- update(pairwise_trimmed, bootstrap = TRUE, seed = 12345)
summary(omnibus_LSM)
summary(omnibus_trimmed)
summary(pairwise_trimmed)
summary(pairwise_trimmed_boot)



