library(zooaRch)


### Name: mort.func
### Title: Analysis of Mortality Profiles
### Aliases: mort.func
### Keywords: analysis

### ** Examples

# Example 1: Payne 1973
 data(marjRab)

# Inspect data structure  
 head(marjRab)
 
# create age-class labels: Payne 1973 uses ageclasses A-I
 Labels <-c('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I')
 mort.func(mortData=marjRab,labels=Labels, models=1:3, ci=95, plot=TRUE, iter=1000)
 
# Example 2: Garnsey Site Bison Data (from Speth 1983)
 data(speth83)

# Inspect data structure  
 head(speth83)

# create age-class labels using the 13 age classes of Speth's (1983) scheme.
 Labels <-c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13)

# Use the catastrophic and attritional mortality curves (after Stiner 1990).
 mort.func(mortData=speth83,labels=Labels, models=4:5, ci=95, plot=TRUE, iter=1000)



