library(egor)


### Name: subset.egor
### Title: Filter and Subset Ego-centered Datasets
### Aliases: subset.egor [.egor

### ** Examples


# Generate a small sample dataset
(e <- make_egor(5,4))

# First three egos in the dataset
e[1:3,]

# Similarly with subset()
subset(e, .egoRow <= 3)

# Using an external vector
# (though normally, we would use e[.keep,] here)
.keep <- rep(c(TRUE, FALSE), length.out=nrow(e))
subset(e, .keep[.egoRow])
# a more robust version of the above: pass a function of row and
# keep (which is passed as an additional argument to the function):
subset(e, function(r, keep) keep[r$.egoRow], .keep)

# Only keep egos with exactly three alters
subset(e, nrow(.alts)==3)

# Only keep egos with exactly two female alters
subset(e, sum(.alts$sex=="w")==2)

# Only keep female alters
subset(e, .alts$sex=="w", unit="alter")

# Only keep alters of a different sex form ego
subset(e, sex != .alts$sex, unit="alter")

# Only keep homophilous alter-alter ties
subset(e, .alts$sex[.aaties$.srcRow] ==
          .alts$sex[.aaties$.tgtRow],
       unit="aatie")




