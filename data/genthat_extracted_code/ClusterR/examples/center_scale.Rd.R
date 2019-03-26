library(ClusterR)


### Name: center_scale
### Title: Function to scale and/or center the data
### Aliases: center_scale

### ** Examples


data(dietary_survey_IBS)

dat = dietary_survey_IBS[, -ncol(dietary_survey_IBS)]

dat = center_scale(dat, mean_center = TRUE, sd_scale = TRUE)




