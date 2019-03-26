library(eRm)


### Name: Separation Reliability
### Title: Person Separation Reliability
### Aliases: SepRel print.eRm_SepRel summary.eRm_SepRel

### ** Examples
# Compute Separation Reliability for a Rasch Model:
pers <- person.parameter(RM(raschdat1))
res <- SepRel(pers)
res
summary(res)



