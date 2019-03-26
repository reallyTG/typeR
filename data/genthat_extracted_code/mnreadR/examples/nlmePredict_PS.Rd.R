library(mnreadR)


### Name: nlmePredict_PS
### Title: Estimation of the print size value necessary to achieve a given
###   reading speed.
### Aliases: nlmePredict_PS

### ** Examples

# inspect the structure of the dataframe
head(data_low_vision, 10)

#------

# restrict dataset to one MNREAD test per subject (regular polarity only)
data_regular <- data_low_vision %>%
    filter (polarity == "regular")

# run the NLME model for data grouped by subject
## Not run:  nlme_model <- nlmeModel(data_regular, ps, vd, rt, err, subject) 

#------

# extract the critical print size required 
# to achieve 40 words/min (ie. spot reading) according to the NLME fit 
## Not run:  nlmePredict_PS(nlme_model, 40) 

#------

# extract the critical print size required 
# to achieve 80 words/min (ie. fluent reading) according to the NLME fit 
## Not run:  nlmePredict_PS(nlme_model, 80) 






