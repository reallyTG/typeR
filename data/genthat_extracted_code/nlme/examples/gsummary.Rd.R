library(nlme)


### Name: gsummary
### Title: Summarize by Groups
### Aliases: gsummary
### Keywords: manip

### ** Examples

gsummary(Orthodont)  # default summary by Subject
## gsummary with invariantsOnly = TRUE and omitGroupingFactor = TRUE
## determines whether there are covariates like Sex that are invariant
## within the repeated observations on the same Subject.
gsummary(Orthodont, inv = TRUE, omit = TRUE)



