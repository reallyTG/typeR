library(monitoR)


### Name: collapseClips
### Title: Summarize/Archive Song Events
### Aliases: collapseClips
### Keywords: manip

### ** Examples

data(survey_anno)

data(survey)

events <- collapseClips(rec = survey, start.times = survey_anno[, "start.time"], 
                        end.times = survey_anno[, "end.time"], return.times = FALSE)



