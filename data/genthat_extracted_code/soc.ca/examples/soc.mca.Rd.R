library(soc.ca)


### Name: soc.mca
### Title: Specific Multiple Correspondence Analysis
### Aliases: soc.mca

### ** Examples

# Loads the "taste" dataset included in this package
data(taste)
# Create a data frame of factors containing all the active variables 
taste          <- taste[which(taste$Isup == 'Active'), ]

attach(taste)
active         <- data.frame(TV, Film, Art, Eat)
sup            <- data.frame(Gender, Age, Income)
detach(taste)

# Runs the analysis
result         <- soc.mca(active, sup)

# Prints the results
result

# A specific multiple correspondence analysis
# options defines what words or phrases that are looked for in the labels of the active modalities.
options(passive = c("Film: CostumeDrama", "TV: Tv-Sport"))
soc.mca(active, sup)
options(passive = NULL)



