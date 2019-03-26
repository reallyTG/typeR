library(monitoR)


### Name: bindEvents
### Title: Summarize/Archive Manually Derived Sound Events
### Aliases: bindEvents
### Keywords: manip

### ** Examples
 

data(survey_anno) 
data(survey)

# Don't return times
events <- bindEvents( rec = survey, file = survey_anno, by.species = TRUE, parallel = FALSE,
                     return.times = FALSE)

# Return times       
events <- bindEvents( rec = survey, file = survey_anno, by.species = TRUE, parallel = FALSE,
                     return.times = TRUE)
        



