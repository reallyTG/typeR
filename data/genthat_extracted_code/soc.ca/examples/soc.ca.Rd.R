library(soc.ca)


### Name: soc.ca
### Title: Soc.ca a package for specific correspondence analysis
### Aliases: soc.ca soc.ca-package

### ** Examples

data(taste)
# Create a data frame of factors containing all the active variables 
taste          <- taste[which(taste$Isup == 'Active'), ]

attach(taste)
active         <- data.frame(TV, Film, Art, Eat)
sup            <- data.frame(Gender, Age, Income)
detach(taste)

# Runs the analysis
result         <- soc.mca(active, sup)



