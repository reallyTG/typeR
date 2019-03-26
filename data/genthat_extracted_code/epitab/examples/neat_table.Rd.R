library(epitab)


### Name: neat_table
### Title: Displays a neatly formatted contingency table.
### Aliases: neat_table

### ** Examples


# This example uses a dummy data set of whether an individual was treated or not
treat <- data.frame(age=abs(rnorm(100, 60, 20)),
                    sex=factor(sample(c("M", "F"), 100, replace=TRUE)),
                    variant=factor(sample(c("A", "B"), 100, replace=TRUE)),
                    treated=factor(sample(c("Yes", "No"), 100, replace=TRUE),
                                   levels=c("Yes", "No")))
treat$agebin <- cut(treat$age, breaks=c(0, 40, 60, 80, 9999),
                    labels=c("0-40", "41-60", "61-80", "80+"))

tab <- contingency_table(list("Age"='agebin', "Sex"='sex'),
                         outcomes=list('Treated'='treated'),
                         crosstab_funcs=list(freq()),
                         col_funcs=list("Mean age"=summary_mean('age')),
                         data=treat)

# For use in an Rmarkdown that outputs to HTML
neat_table(tab, 'html')

# When outputting to PDF, the \code{booktabs} option produces well-formatted tables
neat_table(tab, 'latex', booktabs=TRUE)



