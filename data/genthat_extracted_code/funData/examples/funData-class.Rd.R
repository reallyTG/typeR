library(funData)


### Name: funData-class
### Title: A class for (univariate) functional data
### Aliases: funData-class funData funData,list,array-method
###   funData,numeric,array-method show,funData-method names,funData-method
###   names<-,funData-method str,funData-method summary,funData-method

### ** Examples

### Creating a one-dimensional funData object with 2 observations
# Basic
f1 <- new("funData", argvals = list(1:5), X = rbind(1:5,6:10))
# Using the constructor with first argument supplied as array
f2 <- funData(argvals = list(1:5), X = rbind(1:5, 6:10)) 
# Using the constructor with first argument supplied as numeric vector
f3 <- funData(argvals = 1:5, X = rbind(1:5, 6:10)) 
# Test if all the same
all.equal(f1,f2) 
all.equal(f1,f3)
# Display funData object in the console
f3 

# A more realistic object
argvals <- seq(0,2*pi,0.01)
object <- funData(argvals, outer(seq(0.75, 1.25, by = 0.05), sin(argvals)))
# Display / summary give basic information
object 
summary(object)
# Use the plot function to get an impression of the data
plot(object) 


### Higher-dimensional funData objects with 2 observations
# Basic
g1 <- new("funData", argvals = list(1:5, 1:3),
                     X = array(1:30, dim = c(2,5,3))) 
# Using the constructor
g2 <- funData(argvals = list(1:5, 1:3),
              X = array(1:30, dim = c(2,5,3)))
# Test if the same
all.equal(g1,g2)
# Display funData object in the console
g2 
# Summarize information
summary(g2)



