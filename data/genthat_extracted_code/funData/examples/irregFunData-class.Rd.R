library(funData)


### Name: irregFunData-class
### Title: A class for irregularly sampled functional data
### Aliases: irregFunData-class irregFunData irregFunData,list,list-method
###   show,irregFunData-method names,irregFunData-method
###   names<-,irregFunData-method str,irregFunData-method
###   summary,irregFunData-method

### ** Examples

# Construct an irregular functional data object
i1 <- irregFunData(argvals = list(1:5, 2:4), X = list(2:6, 3:5))
# Display in the console
i1
# Summarize
summary(i1)

# A more realistic object
argvals <- seq(0,2*pi, 0.01)
ind <- replicate(11, sort(sample(1:length(argvals), sample(5:10,1)))) # sample observation points
argvalsIrreg <- lapply(ind, function(i){argvals[i]})
i2 <- irregFunData(argvals = argvalsIrreg, X = mapply(function(x, a){a * sin(x)},
             x = argvalsIrreg, a = seq(0.75, 1.25, by = 0.05)))
# Display/summary gives basic information
i2
summary(i2)
# Use the plot function to get an impression of the data
plot(i2) 



