library(CalibrateSSB)


### Name: LinCombMatrix
### Title: Creation of linear combination matrices
### Aliases: LinCombMatrix PeriodDiff Period LagDiff LagDiff Period
###   PeriodDiff

### ** Examples


# We assume two years of four quarters (n=8)

# Quarter to quarter differences
LagDiff(8)

# Changes from same quarter last year
LagDiff(8,4)

# Yearly averages
Period(8,4)

# Moving yearly averages
Period(8,4,overlap=TRUE)

# Difference between yearly averages
PeriodDiff(8,4) # Also try n=16 with overlap=TRUE/FALSE

# Combine two variants and add row names
lc = rbind(LagDiff(8,4),PeriodDiff(8,4))
rownames(lc) = c("diffQ1","diffQ2","diffQ3","diffQ4","diffYearMean")
lc




