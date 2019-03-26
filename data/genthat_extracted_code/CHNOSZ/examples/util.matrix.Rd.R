library(CHNOSZ)


### Name: util.matrix
### Title: Functions for Various Matrix Operations
### Aliases: util.matrix invertible.combs

### ** Examples
## Don't show: 
data(thermo)
## End(Don't show)
## what combinations of the 20 common amino acids have
## a linearly independent stoichiometry with five elements?
# the names of the amino acids
aanames <- aminoacids("")
# their species indices
iaa <- suppressMessages(info(aanames))
# the full stoichiometric matrix
A <- i2A(iaa)
# the invertible combinations
icA <- invertible.combs(A)
stopifnot(nrow(icA)==6067)
# that's a bit less than 40% of all possible combinations
nrow(icA) / ncol(combn(20, 5))
# count the occurrences of each amino acid
counts <- table(icA)
names(counts) <- aminoacids(1)
(sc <- sort(counts))
# the two sulfur-containing ones show up most frequently
stopifnot(tail(names(sc), 2)==c("C", "M"))



