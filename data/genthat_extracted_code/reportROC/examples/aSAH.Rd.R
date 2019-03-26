library(reportROC)


### Name: aSAH
### Title: Subarachnoid hemorrhage data
### Aliases: aSAH
### Keywords: datasets

### ** Examples

# load the dataset
data(aSAH)

# Gender, outcome and set
with(aSAH, table(gender, outcome))

# Age
with(aSAH, by(age, outcome, mean))
with(aSAH, by(age, outcome,
     function(x) sprintf("mean: %.1f (+/- %.1f), median: %.1f (%i-%i)",
                         mean(x), sd(x), median(x), min(x), max(x))))

# WFNS score
with(aSAH, table(wfns=ifelse(wfns<=2, "1-2", "3-4-5"), outcome))




