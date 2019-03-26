library(VGAMdata)


### Name: oly12
### Title: 2012 Summer Olympics: Individuals Data
### Aliases: oly12
### Keywords: datasets

### ** Examples

data(oly12)
mtab <- with(oly12, table(Country, Gold))
(mtab <- head(sort(mtab[, "1"] + 2 * mtab[, "2"], decreasing = TRUE), 10))

## Not run: 
##D barplot(mtab, col = "gold", cex.names = 0.8, names = abbreviate(names(mtab)),
##D         beside = TRUE, main = "2012 Summer Olympic Final Gold Medal Count",
##D         ylab = "Gold medal count", las = 1, sub = "Top 10 countries")
## End(Not run)



