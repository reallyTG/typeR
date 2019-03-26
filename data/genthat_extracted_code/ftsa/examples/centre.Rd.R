library(ftsa)


### Name: centre
### Title: Mean function, variance function, median function, trim mean
###   function of functional data
### Aliases: centre
### Keywords: models

### ** Examples

# mean function is often removed in the functional principal component analysis.
# trimmed mean function is sometimes employed for robustness in the presence of outliers.
# In calculating trimmed mean function, several functional depth measures were employed.	
centre(x = ElNino$y, type = "mean")
centre(x = ElNino$y, type = "var")
centre(x = ElNino$y, type = "median")
centre(x = ElNino$y, type = "trimmed")



