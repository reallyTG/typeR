library(reporttools)


### Name: tableDate
### Title: Display descriptive statistics for date variables
### Aliases: tableDate
### Keywords: manip chron

### ** Examples

set.seed(1977)
diagnosis <- as.Date(round(runif(10, min = 35000, max = 40000)), 
    origin = "1899-12-30")
death <- as.Date(round(runif(10, min = 35000, max = 40000)), 
    origin = "1899-12-30")
vars <- data.frame(diagnosis, death)
group <- sample(c(rep("A", 5), rep("B", 5)))
tableDate(vars = vars, group = group, stats = c("n", "min", "median", "max", "na"), 
    cap = "Table of date variables.", lab = "tab: descr stat date")
    
## suppose we have weighted observations
weights <- c(2, 3, 1, 4, rep(1, 6))
subset <- 1:5
tableDate(vars = vars, weights = weights, subset = subset, 
    cap = "Table of date variables.", lab = "tab: descr stat date")

## For backward compatibility, disp.cols and nams are still working.
## If a list is given to vars, the variables can be of different length. 
## However, then weights, subset, and group must be set to NA (the default).
tableDate(vars = list(diagnosis, death), nams = c("Diagnosis", "Death"), 
    disp.cols = c("n", "na", "min", "max"), print.pval = FALSE, cap = 
    "Table of date variables.", lab = "tab: descr stat date")    



