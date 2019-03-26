library(PASWR2)


### Name: INSURQUOTES
### Title: Insurance Quotes
### Aliases: INSURQUOTES
### Keywords: datasets

### ** Examples

ggplot(data = INSURQUOTES, aes(sample = companyA - companyB)) + 
stat_qq(col = "orange", size = 4)
with(data = INSURQUOTES,
t.test(companyA, companyB))



