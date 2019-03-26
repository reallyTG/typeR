library(epitab)


### Name: contingency_table
### Title: Builds a contingency table
### Aliases: contingency_table

### ** Examples


# This example uses a dummy data set of whether an individual was treated or not
treat <- data.frame(age=abs(rnorm(100, 60, 20)),
                    sex=factor(sample(c("M", "F"), 100, replace=TRUE)),
                    variant=factor(sample(c("A", "B"), 100, replace=TRUE)),
                    treated=factor(sample(c("Yes", "No"), 100, replace=TRUE),
                                   levels=c("Yes", "No")))
treat$agebin <- cut(treat$age, breaks=c(0, 40, 60, 80, 9999),
                    labels=c("0-40", "41-60", "61-80", "80+"))

# Displays a standard contingency table
contingency_table(list("Age"='agebin', "Sex"='sex'),
                  outcomes=list('Treated'='treated'),
                  crosstab_funcs=list(freq()),
                  data=treat)

# Continuous variables can be summarised with respect to the outcome
# by using col_funcs
contingency_table(list("Age"='agebin', "Sex"='sex'),
                  outcomes=list('Treated'='treated'),
                  crosstab_funcs=list(freq()),
                  col_funcs=list("Mean age"=summary_mean('age')),
                  data=treat)

# Regression coefficients can be added using row_funcs
contingency_table(list("Age"='agebin', "Sex"='sex'),
                   treat,
                   outcomes=list('Treated'='treated'),
                   crosstab_funcs=list(freq()),
                   row_funcs=list("Odds ratio"=odds_ratio('treated'),
                                  "Adjusted odds ratio"=odds_ratio('treated', adjusted=TRUE)))




