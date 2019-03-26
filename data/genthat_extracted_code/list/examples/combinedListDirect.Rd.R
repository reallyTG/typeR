library(list)


### Name: combinedListDirect
### Title: Combined List Estimator
### Aliases: combinedListDirect

### ** Examples


# Load data from Aronow, Coppock, Crawford, and Green (2015)
data("combinedListExps")

# complete case analysis
combinedListExps <- na.omit(combinedListExps)
# Conduct estimation without covariate adjustment
out.1 <- combinedListDirect(list1N ~ list1treat, 
                            data = subset(combinedListExps, directsfirst==1), 
                            treat = "list1treat", direct = "direct1")
summary(out.1)

# Conduct estimation with covariate adjustment
out.2 <- combinedListDirect(list1N ~ list1treat + gender + 
                            ideology + education + race, 
                            data = subset(combinedListExps, directsfirst==1), 
                            treat = "list1treat", direct = "direct1")
summary(out.2)




