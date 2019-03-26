library(reporttools)


### Name: tableContinuous
### Title: Generate a LaTeX table of descriptive statistics for continuous
###   variables
### Aliases: tableContinuous
### Keywords: manip character

### ** Examples

data(CO2)
vars <- CO2[, 4:5]
group <- CO2[, "Treatment"]
weights <- c(rep(1, 60), rep(0, 10), rep(2, 14))

## display default statistics, provide neither group nor weights
tableContinuous(vars = vars, stats = c("n", "min", "mean", "median", 
    "max", "iqr", "na"), print.pval = "kruskal", 
    cap = "Table of continuous variables.", lab = "tab: descr stat")

## display default statistics, only use a subset of observations, grouped analysis
tableContinuous(vars = vars, weights = weights, subset = 
    c(rep(TRUE, 57), rep(FALSE, 100 - 57)), group = group, prec = 3, print.pval = 
    "kruskal", cap = "Table of continuous variables.", lab = "tab: descr stat")

## supply user-defined statistics: trimmed mean and IQR as an unbiased estimate 
## of the population standard deviation in case of normal data
my.stats <- list("n", "na", "mean", "$\\bar{x}_{trim}$" = function(x){return(mean(x, 
    trim = .05))}, "iqr", "IQR.unbiased" = function(x){return(IQR(x) / 
    (2 * qnorm(3 / 4)))})
tableContinuous(vars = vars, weights = weights, group = group, stats = my.stats, 
    prec = 3, print.pval = "none", cap = "Table of continuous variables.", 
    lab = "tab: descr stat")

## disp.cols and nams can still be used, for backward compatibility.
## If a list is given to vars, the variables can be of different length. However,
## then weights, subset, and group must be set to NA (the default).
tableContinuous(vars = list(CO2$conc, CO2$uptake, rnorm(1111), runif(2222)), 
    nams = c("conc", "uptake", "random1", "random2"), disp.cols = 
    c("n", "min", "median", "max", "iqr", "na"), cap = "Table of continuous variables.", lab = 
    "tab: descr stat")



