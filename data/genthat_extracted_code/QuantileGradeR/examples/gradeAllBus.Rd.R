library(QuantileGradeR)


### Name: gradeAllBus
### Title: Grade Businesses.
### Aliases: gradeAllBus

### ** Examples



## ===== Quantile-Adjusted Grading =====
## ZIP Code Cutoffs (see findCutoffs documentation for an explanation of how
## these are calculated)

 zipcode.cutoffs.df <- findCutoffs(X.kc, zips.kc, gamma = c(0, 30))

## In King County, we use a restaurant's mean inspection score over the last
## four inspections for grading (see Ho, D.E.,
## Ashwood, Z.C., and Elias, B. "Improving the Reliability of Food Safety
## Disclosure: A Quantile Adjusted Restaurant Grading System for Seattle-King
## County" (working paper)). Calculate these mean scores:

 mean.scores <- rowMeans(X.kc, na.rm = TRUE)

## We then use the mean scores and the zipcode.cutoffs.df dataframe to perform
## grading:

 adj.grades <- gradeAllBus(mean.scores, zips.kc, zipcode.cutoffs.df)


## ===== Traditional Grading Systems =====
## For comparison, calculate grades as if we had used a traditional grading
## system in King County, with 0 and 30 as the A/B and B/C cutoffs for all ZIP
## codes.

## Cutoffs:

 unadj.cutoffs.df <- createCutoffsDF(X.kc, zips.kc, gamma = c(0, 30), type = "unadj")

## Grades (traditional grading systems only use the most recent inspection score
## for grading):

 unadj.grades <- gradeAllBus(scores = X.kc[,c(1)], zips.kc, zip.cutoffs = unadj.cutoffs.df)


## ===== Comparison: Quantile-Adjusted Grading and Traditional Grading ===
## Proportion of restaurants in each grading category varies dramatically
## between ZIPs in traditional compared to quantile-adjusted grading; these
## differences do not reflect sanitation differences, but rather differences in
## stringency across inpectors (see: Ho, D.E., Ashwood, Z.C., and Elias, B.
## "Improving the Reliability of Food Safety Disclosure: A Quantile Adjusted
## Restaurant Grading System for Seattle-King County" (working paper)).
## Tabulate restaurants in each ZIP code in each grading category and then
## divide by total number of restaurants in each ZIP to obtain proportions.
## Proportions are rounded to 2 decimal places.

## Traditional Grading

 foo1 <- round(table(zips.kc, unadj.grades)/apply(table(unadj.grades, zips.kc), 2, sum), 2)

## Quantile-Adjusted Grading

 foo2 <- round(table(zips.kc, adj.grades)/apply(table(adj.grades, zips.kc), 2, sum), 2)




