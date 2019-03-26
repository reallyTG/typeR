library(equate)


### Name: freqtab
### Title: Frequency Distribution Tables
### Aliases: freqtab freqtab.default as.freqtab freqtab.table
###   as.data.frame.freqtab head.freqtab tail.freqtab scales margin margins
###   droplevels.freqtab
### Keywords: methods

### ** Examples


# Univariate distribution with score scale
set.seed(2005)
x <- round(rnorm(1000, 100, 10))
head(freqtab(x, scales = 70:130))

# Existing frequency table converted to class "freqtab"
# The first score of zero, with zero counts, is dropped
head(as.freqtab(ACTmath[, 1:2], drop = TRUE))

# Bivariate distribution
# Reduce y to the anchor test margin (2)
ny <- freqtab(x = KBneat$y, scales = list(0:36, 0:12))
margin(ny, margin = 2)

# Summing scored item responses with the PISA data
attach(PISA)
r6items <- paste(items$itemid[items$clusterid == "r6"])
r7items <- paste(items$itemid[items$clusterid == "r7"])
pisa67 <- freqtab(students[students$book == 6, ],
	items = list(r6items, r7items),
	scales = list(0:16, 0:14))
detach(PISA)

# Scales for both margins
# Zero total score is unobserved
scales(pisa67, 1:2)
scales(droplevels(pisa67), 1:2)




