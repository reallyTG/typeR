library(tlm)


### Name: cotinine
### Title: Birth Weight and Cord Serum Cotinine
### Aliases: cotinine
### Keywords: datasets

### ** Examples

data(cotinine)
par(las = 1, mfrow = c(2, 2))
with(cotinine, plot(cotinine, weight))
with(cotinine, plot(logcotinine, weight))
with(cotinine, boxplot(cotinine ~ underweight))
with(cotinine, boxplot(logcotinine ~ underweight))



