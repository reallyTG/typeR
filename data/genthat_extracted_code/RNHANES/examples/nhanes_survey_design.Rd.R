library(RNHANES)


### Name: nhanes_survey_design
### Title: Build survey objects for NHANES data
### Aliases: nhanes_survey_design

### ** Examples


## Not run: 
##D dat <- nhanes_load_data("UHG_G", "2011-2012", demographics = TRUE)
##D 
##D design <- nhanes_survey_design(dat, "WTSA2YR")
##D 
##D svymean(~RIDAGEYR, design)
##D 
##D svyglm(URXUHG ~ RIDAGEYR + RIAGENDR, design)
## End(Not run)




