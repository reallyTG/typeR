library(Fahrmeir)


### Name: Regensburg
### Title: Job Expectation
### Aliases: Regensburg
### Keywords: datasets

### ** Examples

str(Regensburg)
summary(Regensburg)
# Example 3.5 page 83 in book:
library(MASS)
Regensburg$y <- ordered(Regensburg$y)
Regensburg.polr <- polr(y~lage, data=Regensburg, weights = n) 
summary(Regensburg.polr)
class(Regensburg.polr)



