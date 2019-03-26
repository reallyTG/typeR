library(wordspace)


### Name: subset.dsm
### Title: Subsetting Distributional Semantic Models (wordspace)
### Aliases: subset.dsm

### ** Examples


print(DSM_TermContext$M)
model <- DSM_TermContext

subset(model, nchar(term) <= 4)$M     # short target terms
subset(model, select=(nnzero <= 3))$M # columns with <= 3 nonzero cells

subset(model, nchar(term) <= 4, nnzero <= 3)$M # combine both conditions

subset(model, nchar(term) <= 4, nnzero >= 2)$M # still three columns with nnzero < 2
subset(model, nchar(term) <= 4, nnzero >= 2, recursive=TRUE)$M




