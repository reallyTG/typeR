library(RM.weights)


### Name: tab.weight
### Title: Rasch descriptives and weighted tables.
### Aliases: tab.weight

### ** Examples

data(data.FAO_country1)
XX.country1 = data.FAO_country1[,1:8]
wt.country1 = data.FAO_country1$wt
gender = data.FAO_country1$gender
urbanrural = data.FAO_country1$urbanrural
# Univariate weighted table by gender
tab.weight(gender, wt.country1)$tab.ext.w

# Bivariate weighted table by gender and urban/rural
tab.weight(list(gender,urbanrural), wt.country1)$tab.ext.w

# Fit Rasch descriptives
fit.descr = tab.weight(wt = wt.country1, XX = XX.country1)
# Weighted distribution across raw-scores (absolute and relative)
cbind("Abs.RS distrib." = fit.descr$RS.abs.w, 
"Rel.RS distrib." = fit.descr$RS.rel.w)
# Weighted and unweighted percentage of Yes per item
cbind("Weighted perc. of Yes" = fit.descr$Perc.Yes.w, 
      "Unweighted perc. of Yes" = fit.descr$Perc.Yes)



