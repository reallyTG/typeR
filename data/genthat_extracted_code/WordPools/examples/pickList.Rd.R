library(WordPools)


### Name: pickList
### Title: Select Items from a Word Pool in Given Ranges
### Aliases: pickList
### Keywords: datagen

### ** Examples

data(Paivio)
# 2 lists, no selection on any variables
pickList(Paivio, nlists=2)

# Define ranges for low and high on imagery, concreteness, meaningfulness
# These go from low - median, and median-high on each variable
vars <- 3:5
(low <- as.data.frame(apply(Paivio[,vars], 2, fivenum))[c(1,3),])
(high <- as.data.frame(apply(Paivio[,vars], 2, fivenum))[c(3,5),])

# select two lists of 10 low/high imagery items
lowI <- pickList(Paivio, low[,"imagery", drop=FALSE], nitems=10, nl=2)
highI <- pickList(Paivio, high[,"imagery", drop=FALSE], nitems=10, nl=2)

# compare means
colMeans(lowI[,c(4:8)])
colMeans(highI[,c(4:8)])

# using a list of ranges
L <- list(imagery=c(1,5), concreteness=c(1,4))
pickList(Paivio, L)



