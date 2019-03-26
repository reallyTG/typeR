library(ftsa)


### Name: pcscorebootstrapdata
### Title: Bootstrap independent and identically distributed functional
###   data or functional time series
### Aliases: pcscorebootstrapdata
### Keywords: models

### ** Examples

# Bootstrapping the distribution of a summary statistics of functional data.	
boot1 = pcscorebootstrapdata(ElNino$y, 400, "mean", bootmethod = "st")
boot2 = pcscorebootstrapdata(ElNino$y, 400, "mean", bootmethod = "sm", smo = 0.05)
boot3 = pcscorebootstrapdata(ElNino$y, 400, "mean", bootmethod = "mvn")
boot4 = pcscorebootstrapdata(ElNino$y, 400, "mean", bootmethod = "stiefel")
boot5 = pcscorebootstrapdata(ElNino$y, 400, "mean", bootmethod = "meboot")



