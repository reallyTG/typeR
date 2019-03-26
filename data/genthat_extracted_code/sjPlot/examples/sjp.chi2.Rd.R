library(sjPlot)


### Name: sjp.chi2
### Title: Plot Pearson's Chi2-Test of multiple contingency tables
### Aliases: sjp.chi2

### ** Examples

# create data frame with 5 dichotomous (dummy) variables
mydf <- data.frame(as.factor(sample(1:2, 100, replace=TRUE)),
                   as.factor(sample(1:2, 100, replace=TRUE)),
                   as.factor(sample(1:2, 100, replace=TRUE)),
                   as.factor(sample(1:2, 100, replace=TRUE)),
                   as.factor(sample(1:2, 100, replace=TRUE)))
# create variable labels
items <- list(c("Item 1", "Item 2", "Item 3", "Item 4", "Item 5"))

# plot Chi2-contingency-table
sjp.chi2(mydf, axis.labels = items)




