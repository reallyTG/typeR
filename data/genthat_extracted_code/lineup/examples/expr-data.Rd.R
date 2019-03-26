library(lineup)


### Name: expr-data
### Title: Example gene expression data
### Aliases: expr-data expr1 expr2
### Keywords: datasets

### ** Examples

data(expr1)
data(expr2)

# identify the common individuals
id <- findCommonID(rownames(expr1), rownames(expr2))

# correlation between tissues for each gene
rho <- corbetw2mat(expr1[id$first,], expr2[id$second,])
hist(rho, breaks=100)



