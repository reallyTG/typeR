library(questionr)


### Name: chisq.residuals
### Title: Return the chi-squared residuals of a two-way frequency table.
### Aliases: chisq.residuals residus

### ** Examples

## Sample table
data(Titanic)
tab <- apply(Titanic, c(1,4), sum)
## Pearson residuals
chisq.residuals(tab)
## Standardized residuals
chisq.residuals(tab, std = TRUE)
## Raw residuals
chisq.residuals(tab, raw = TRUE)



