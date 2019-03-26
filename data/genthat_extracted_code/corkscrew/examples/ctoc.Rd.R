library(corkscrew)


### Name: ctoc
### Title: Categorical variables into Continuous features
### Aliases: ctoc
### Keywords: ~misc

### ** Examples

data(ChickWeight)
# Converting the "Chick" variable into factor from ord.factor for demonstration purposes.
ChickWeight$Chick <- as.factor(as.numeric(ChickWeight$Chick))
# Returns a dataframe with two added columns for "Chick" and "Diet"
head(ctoc(y = "weight", x = c("Chick","Diet"), data = ChickWeight, min.obs = 12))



