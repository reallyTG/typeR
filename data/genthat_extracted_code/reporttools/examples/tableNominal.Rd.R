library(reporttools)


### Name: tableNominal
### Title: Display descriptive statistics for nominal variables
### Aliases: tableNominal
### Keywords: manip character

### ** Examples

data(CO2)
vars <- CO2[, 1:2]
group <- CO2[, "Treatment"]
weights <- c(rep(1, 60), rep(0, 10), rep(2, 14))
     
## first all observations
tableNominal(vars = vars, weights = weights, group = group, cap = 
    "Table of nominal variables.", lab = "tab: nominal")

## do not include cumulative percentages
tableNominal(vars = vars, weights = weights, group = group, cap = 
    "Table of nominal variables.", lab = "tab: nominal", cumsum = FALSE)

## but include p-value for Fisher's exact test
tableNominal(vars = vars, weights = weights, group = group, cap = 
    "Table of nominal variables.", lab = "tab: nominal",
    print.pval = "fisher", cumsum = FALSE)     

## Fisher's exact test without simulated p-value
tableNominal(vars = vars, weights = weights, group = group, cap = 
    "Table of nominal variables.", lab = "tab: nominal",
    print.pval = "fisher", fisher.B = Inf, cumsum = FALSE)     

## then only consider a subset of observations
subset <- c(1:50, 60:70)
tableNominal(vars = vars, weights = weights, subset = subset, group = group, 
    cap = "Table of nominal variables.", lab = "tab: nominal")

## do not include cumulative percentages
tableNominal(vars = vars, weights = weights, subset = subset, group = group, 
    cap = "Table of nominal variables.", lab = "tab: nominal", cumsum = FALSE)     

## Not run: 
##D ## caption placement at the top and repeat column headings on top of each page
##D ## in the longtable format. Have to manually add another backslash to hline and endhead
##D ## below (they are removed when compiling the help file)!
##D tableNominal(vars = vars, cap = "Table of nominal variables.", cumsum = FALSE, 
##D caption.placement = "top", longtable = TRUE, add.to.row = list(pos = list(0), 
##D command = "\hline \endhead ")
## End(Not run)



