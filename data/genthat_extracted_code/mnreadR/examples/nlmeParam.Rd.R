library(mnreadR)


### Name: nlmeParam
### Title: Maximum Reading Speed (MRS) and Critical Print Size (CPS)
###   estimation using a nonlinear mixed-effect (NLME) modeling.
### Aliases: nlmeParam

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

# run the parameters' estimation for a default CPS criterion of '90 of MRS' 
## Not run:  nlmeParam(nlme_model) 

# run the parameters' estimation for a specific CPS criterion of '80 of MRS'
## Not run:  nlmeParam(nlme_model, 0.8) 






