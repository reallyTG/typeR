library(coalitions)


### Name: as_survey
### Title: Creates basic survey table from votes in percent
### Aliases: as_survey
### Keywords: internal

### ** Examples

forsa <- as_survey(
 percent    = c(0.41, 0.24, 0.13, 0.04, 0.08, 0.03, 0.03, 0.04),
 samplesize = 2508,
 parties    = c("cdu/csu", "spd", "gruene", "fdp", "linke", "piraten", "afd", "others"))
forsa



