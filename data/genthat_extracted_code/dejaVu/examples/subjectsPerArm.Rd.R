library(dejaVu)


### Name: subjectsPerArm
### Title: S3 generic to output the number of subjects in each arm for a
###   given object
### Aliases: subjectsPerArm

### ** Examples

sim <- SimulateComplete(study.time=365,number.subjects=50,
event.rates=c(0.01,0.005),dispersions=0.25)
subjectsPerArm(sim)



