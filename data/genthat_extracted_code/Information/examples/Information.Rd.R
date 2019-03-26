library(Information)


### Name: Information
### Title: Data exploration with information theory (weight-of-evidence and
###   information value)
### Aliases: Information Information-package
### Keywords: IV, NIV, NWOE, WOE, classification, uplift
###   weight-of-evidence,

### ** Examples

##------------------------------------------------------------
## WOE analysis, no validation
##------------------------------------------------------------
library(Information)

data(train, package="Information")
train <- subset(train, TREATMENT==1)
IV <- Information::create_infotables(data=train, y="PURCHASE", parallel=FALSE)

print(head(IV$Summary), row.names=FALSE)
print(IV$Tables$N_OPEN_REV_ACTS, row.names=FALSE)

# Plotting a single variable
Information::plot_infotables(IV, "N_OPEN_REV_ACTS")

# Plotting multiple variables
Information::plot_infotables(IV, IV$Summary$Variable[1:4], same_scale=TRUE)

# If the goal is to plot multiple variables individually, as opposed to a comparison-grid, we can
# loop through the variable names and create individual plots
## Not run: 
##D names <- names(IV$Tables)
##D plots <- list()
##D for (i in 1:length(names)){
##D   plots[[i]] <- plot_infotables(IV, names[i])
##D }
##D # Showing the top 18 variables
##D plots[1:18]
## End(Not run)

# We can speed up create_infotables() by setting parallel=TRUE (default setting)
# If we leave ncore as the default, ncore is set to available clusters - 1
## Not run: 
##D train <- subset(train, TREATMENT==1)
##D IV <- Information::create_infotables(data=train, y="PURCHASE")
## End(Not run)
closeAllConnections()



