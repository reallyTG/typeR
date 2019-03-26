library(pubh)


### Name: expand_df
### Title: Expand a data frame.
### Aliases: expand_df

### ** Examples

Freq <- c(5032, 5095, 41, 204)
Mortality <- gl(2, 2, labels=c("No", "Yes"))
Calcium <- gl(2, 1, 4, labels=c("No", "Yes"))
anyca <- data.frame(Freq, Mortality, Calcium)
anyca
anyca.exp <- expand_df(anyca)
with(anyca.exp, table(Calcium, Mortality))



