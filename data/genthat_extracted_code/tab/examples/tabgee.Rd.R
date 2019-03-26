library(tab)


### Name: tabgee
### Title: Generate Summary Tables of Fitted Generalized Estimating
###   Equations for Statistical Reports
### Aliases: tabgee
### Keywords: table generalized estimating equation marginal model

### ** Examples

# Load in sample dataset d and convert to long format
data(d)
d2 <- reshape(data = d, 
              varying = c("bp.1", "bp.2", "bp.3", "highbp.1", "highbp.2", "highbp.3"), 
              timevar = "bp.visit", direction = "long")
d2 <- d2[order(d2$id), ]

# Load required package gee
library("gee")

# Create labels for race levels
races <- c("White", "Black", "Mexican American", "Other")

# Test whether predictors are associated with blood pressure at 1, 2, and 3 months
geefit1 <- gee(bp ~ Age + Sex + Race + BMI + Group, id = id, data = d2, 
               corstr = "unstructured")
               
# Create summary table using tabgee
geetable1 <- tabgee(geefit = geefit1, data = d2, n.id = TRUE, n.total = TRUE,
                    xlabels = c("Intercept", "Age", "Male", "Race", races, "BMI", 
                               "Treatment"))

# Test whether predictors are associated with high blood pressure at 1, 2, and 3 months
geefit2 <- gee(highbp ~ Age + Sex + Race + BMI + Group, id = id, data = d2, 
               family = binomial, corstr = "unstructured")
               
# Create summary table using tabgee
geetable2 <- tabgee(geefit = geefit2, data = d2, ci.beta = FALSE,
                    xlabels = c("Intercept", "Age", "Male", "Race", races, "BMI", 
                               "Treatment"))

# Click on geetable1 or geetable2 in the Workspace tab of RStudio to see the tables that 
# could be copied and pasted into a report or manuscript. Alternatively, setting the
# latex input to TRUE produces tables that can be inserted into LaTeX using the xtable 
# package.



