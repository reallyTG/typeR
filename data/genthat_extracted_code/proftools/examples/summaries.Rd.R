library(proftools)


### Name: summaries
### Title: Basic Profile Data Summaries
### Aliases: funSummary callSummary pathSummary srcSummary
### Keywords: programming utilities

### ** Examples

pd <- readProfileData(system.file("samples", "glmEx.out", package="proftools"))
funSummary(pd)
callSummary(pd)
pathSummary(pd)



