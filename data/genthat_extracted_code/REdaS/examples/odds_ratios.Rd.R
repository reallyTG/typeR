library(REdaS)


### Name: Odds-Ratios
### Title: Compute (Log) Odds Ratios
### Aliases: odds_ratios print.REdaS_ORs summary.REdaS_ORs

### ** Examples
# create a table from a 2 x 2 matrix of frequencies using as.table()
tab <- as.table( matrix(c(49, 1, 5, 45), 2) )
dimnames(tab) <- list("LED on?" = c("no", "yes"),
                      "PC running?" = c("no", "yes"))
tab

odds_ratios(tab)

# generate a matrix with 3 variables and 100 observations
# note that each variable must have exactly two categories
set.seed(5)
x <- data.frame("A" = as.factor(sample(1:2, 100, TRUE)),
                "B" = as.factor(sample(3:4, 100, TRUE)),
                "C" = as.factor(sample(5:6, 100, TRUE)))
head(x)

res <- odds_ratios(x)

# print the results and save the summarized information in a matrix
resmat <- print(res)
resmat

# the summary method gives a rather lengthy output with all tables etc.
summary(res)



