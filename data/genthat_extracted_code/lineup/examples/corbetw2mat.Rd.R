library(lineup)


### Name: corbetw2mat
### Title: Calculate correlations between columns of two matrices
### Aliases: corbetw2mat
### Keywords: array multivariate univar

### ** Examples


data(expr1, expr2)
## Don't show: 
expr1 <- expr1[,1:100]
expr2 <- expr2[,1:100]
## End(Don't show)

# correlations with paired columns
r <- corbetw2mat(expr1, expr2)
# top 10, by absolute value
r[order(abs(r), decreasing=TRUE)[1:10]]

# all pairs of columns with correlation >= 0.8
r_allpairs <- corbetw2mat(expr1, expr2, what="bestpairs", corthresh=0.6)

# for each column in left matrix, most-correlated column in right matrix
r_bestright <- corbetw2mat(expr1, expr2, what="bestright")




