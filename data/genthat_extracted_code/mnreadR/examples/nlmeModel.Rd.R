library(mnreadR)


### Name: nlmeModel
### Title: MNREAD data fitting using a nonlinear mixed-effect (NLME)
###   modeling.
### Aliases: nlmeModel

### ** Examples

# inspect the structure of the dataframe
head(data_low_vision, 10)

#------

# restrict dataset to one MNREAD test per subject (regular polarity only)
data_regular <- data_low_vision %>%
    filter (polarity == "regular")

# run the NLME model for data grouped by subject
## Not run:  model_simple <- nlmeModel(data_regular, ps, vd, rt, err, subject) 

# to print the model summary
## Not run:  summary(model_simple[[2]]) 

# to print the first 3 rows of the cleaned dataset containing the raw data and used to run the model
## Not run:  head(model_simple[[1]], 3) 

#------

# run the NLME model on the whole dataset with polarity nested within subject
## Not run: 
##D  model_nested <- lmeModel(data_low_vision, ps, vd, rt, err, subject,
##D                                    nested = polarity) 
## End(Not run)

#------

# run theNLME model on the whole dataset with polarity nested within subject 
# and grouped based on treatment
## Not run: 
##D  model_nested_grouped <- nlmeModel(data_low_vision, ps, vd, rt, err, subject,
##D                                             nested = polarity, group = treatment) 
## End(Not run)






