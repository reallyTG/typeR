library(BSDA)


### Name: Ligntmonth
### Title: Relationship between damage reports and deaths caused by
###   lightning
### Aliases: Ligntmonth
### Keywords: datasets

### ** Examples


plot(deaths ~ damage, data = Ligntmonth)
model = lm(deaths ~ damage, data = Ligntmonth)
abline(model, col = "red")
rm(model)




