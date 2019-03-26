library(mefa4)


### Name: Xtab
### Title: Sparse Cross Tabulation
### Aliases: Xtab sparseMatrixList-class
### Keywords: manip

### ** Examples

x <- data.frame(
    sample = paste("Sample", c(1,1,2,2,3,4), sep="."),
    species = c(paste("Species", c(1,1,1,2,3), sep="."),  "zero.pseudo"),
    count = c(1,2,10,3,4,0))
x
## Xtab class, counts by repetitions in RHS
(x0 <- Xtab(~ sample + species, x))
## counts by LHS and repetitions in RHS
(x1 <- Xtab(count ~ sample + species, x))
## drop all empty rows
(x2 <- Xtab(count ~ sample + species, x, cdrop=FALSE,rdrop=TRUE))
## drop all empty columns
Xtab(count ~ sample + species, x, cdrop=TRUE,rdrop=FALSE)
## drop specific columns by placeholder
Xtab(count ~ sample + species, x, cdrop="zero.pseudo")

## 2 and 3 way crosstabs
xx <- data.frame(
    sample = paste("Sample", c(1,1,2,2,3,4), sep="."),
    species = c(paste("Species", c(1,1,1,2,3), sep="."),  "zero.pseudo"),
    count = c(1,2,10,3,4,0),
    segment = letters[c(6,13,6,13,6,6)])
xx
Xtab(count ~ sample + species, xx)
Xtab(count ~ sample + species + segment, xx)



