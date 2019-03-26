library(FlowScreen)


### Name: cania.sub.ts
### Title: Subset of the Caniapiscau River Daily Flows
### Aliases: cania.sub.ts
### Keywords: datasets

### ** Examples

# Code used to subset and modify original Caniapiscau series:
## Not run: 
##D data(caniapiscau)
##D cania.ts <- create.ts(caniapiscau, hyrstart=3)
##D cania.sub.ts <- subset(cania.ts, cania.ts$hyear %in% c(1970:1995))
## End(Not run)
# example use of example subset flow series
data(cania.sub.ts)
head(cania.sub.ts)
str(cania.sub.ts)



