library(welchADF)


### Name: adhdData2
### Title: Children's reaction times (milliseconds) to stimuli of different
###   nature, arranged with one single response column and taking the
###   multi-variate response as an explicit within-subjects factor.
### Aliases: adhdData2
### Keywords: datasets

### ** Examples

# Omnibus test of a mixed between x within subjects model, 
# using trimmed means and Winsorized variances
omnibus_trimmed <- welchADF.test(adhdData2, response = "Milliseconds",between.s = "Group", 
  within.s = "Stimulus", subject = "Subject", contrast = "omnibus", trimming = TRUE)
  
# The same using S3 method for class formula. The data can be in separate variables in
# the scope of the call, not necessarily in a data.frame
millis <- adhdData2$Milliseconds
gr <- adhdData2$Group
st <- adhdData2$Stimulus
sbj <- adhdData2$Subject
omnibus_trimmed_formula <- welchADF.test(millis ~ gr*st + (st|sbj), 
  contrast = "omnibus", trimming = TRUE)
summary(omnibus_trimmed_formula)

# Pairwise contrasts of the effects
pairwise_LSM <- welchADF.test(adhdData2, response = "Milliseconds", between.s = "Group", 
  within.s = "Stimulus", subject = "Subject", contrast = "all.pairwise", effect = "Stimulus")
pairwise_trimmed <- update(pairwise_LSM, trimming = TRUE)
  
# Bootstrapping to obtain an empirical critical value
pairwise_trimmed_boot <- update(pairwise_trimmed, bootstrap =TRUE, seed = 123456)
summary(pairwise_trimmed_boot)



