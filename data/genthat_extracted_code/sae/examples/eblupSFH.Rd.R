library(sae)


### Name: eblupSFH
### Title: EBLUPs based on a spatial Fay-Herriot model.
### Aliases: eblupSFH
### Keywords: method

### ** Examples

data(grapes)       # Load data set
data(grapesprox)   # Load proximity matrix 

# Fit Spatial Fay-Herriot model using ML method
resultML <- eblupSFH(grapehect ~ area + workdays - 1, var, grapesprox,
                     method="ML", data=grapes)
resultML

# Fit Spatial Fay-Herriot model using REML method
resultREML <- eblupSFH(grapehect ~ area + workdays - 1, var, grapesprox,
                       data=grapes)
resultREML



