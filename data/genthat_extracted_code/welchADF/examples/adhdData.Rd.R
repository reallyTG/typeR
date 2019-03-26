library(welchADF)


### Name: adhdData
### Title: Children's reaction times (milliseconds) to stimuli of different
###   nature, arranged with four response columns.
### Aliases: adhdData
### Keywords: datasets

### ** Examples

# Assuming a multivariate response
omnibus_LSM_multi <- welchADF.test(adhdData, response = c("TargetAlone", "Congruent",
  "Neutral", "Incongruent"), between.s = "Group", within.s = "multivariate", contrast = "omnibus")
# The same using the S3 method for class formula
omnibus_LSM_multi_form <- welchADF.test(cbind(TargetAlone, Congruent, Neutral, Incongruent)
~ Group, data = adhdData)
  
# Pairwise comparisons of the implicit within-subjects effect present in the multivariate response
pairwise_LSM_multi <- update(omnibus_LSM_multi, contrast = "all.pairwise", effect = "multivariate")
summary(omnibus_LSM_multi)
summary(pairwise_LSM_multi)



