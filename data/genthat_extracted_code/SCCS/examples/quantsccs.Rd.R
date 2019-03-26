library(SCCS)


### Name: quantsccs
### Title: Quantitative exposures in self controlled case series method
### Aliases: quantsccs
### Keywords: Parametric

### ** Examples


# Headaches and blood pressure data. sys and dia (continuoous exposures) are systolic and
# diastolic blood pressure measurements respectively

 bp.mod <- quantsccs(event~sys+dia, indiv=case, event=head,
                      data=bpdat)

 bp.mod



