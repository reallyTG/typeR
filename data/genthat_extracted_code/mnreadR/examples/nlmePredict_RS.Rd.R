library(mnreadR)


### Name: nlmePredict_RS
### Title: Estimation of the reading speed achieved for a given print size.
### Aliases: nlmePredict_RS

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

# extract reading speed achieved at 1.6 logMAR according to the NLME fit 
## Not run:  nlmePredict_RS(nlme_model, 1.6) 






