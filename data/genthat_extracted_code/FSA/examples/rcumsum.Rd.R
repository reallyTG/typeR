library(FSA)


### Name: rcumsum
### Title: Computes the prior to or reverse cumulative sum of a vector.
### Aliases: rcumsum pcumsum
### Keywords: misc

### ** Examples

## Simple example
cbind(vals=1:10,
      cum=cumsum(1:10),
      pcum=pcumsum(1:10),
      rcum=rcumsum(1:10))

## Example with NA
vals <- c(1,2,NA,3)
cbind(vals,
      cum=cumsum(vals),
      pcum=pcumsum(vals),
      rcum=rcumsum(vals))

## Example with NA
vals <- c(1,2,NA,3,NA,4)
cbind(vals,
      cum=cumsum(vals),
      pcum=pcumsum(vals),
      rcum=rcumsum(vals))
      
## Example with a matrix
mat <- matrix(c(1,2,3,4,5),nrow=1)
cumsum(mat)
pcumsum(mat)
rcumsum(mat)

## Example with a table (must be 1-d)
df <- sample(1:10,100,replace=TRUE)
tbl <- table(df)
cumsum(tbl)
pcumsum(tbl)
rcumsum(tbl)

## Example with a data.frame (must be 1-d)
df <- sample(1:10,100,replace=TRUE)
tbl <- as.data.frame(table(df))[,-1]
cumsum(tbl)
pcumsum(tbl)
rcumsum(tbl)



