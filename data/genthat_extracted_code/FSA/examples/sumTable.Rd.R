library(FSA)


### Name: sumTable
### Title: Creates a one- or two-way table of summary statistics.
### Aliases: sumTable sumTable.formula
### Keywords: hplot

### ** Examples

## The same examples as in the old aggregate.table in gdata package
## but data in data.frame to illustrate formula notation
d <- data.frame(g1=sample(letters[1:5], 1000, replace=TRUE),
                g2=sample(LETTERS[1:3], 1000, replace=TRUE),
                dat=rnorm(1000))

sumTable(dat~g1*g2,data=d,FUN=length)       # get sample size
sumTable(dat~g1*g2,data=d,FUN=validn)       # get sample size (better way)
sumTable(dat~g1*g2,data=d,FUN=mean)         # get mean
sumTable(dat~g1*g2,data=d,FUN=sd)           # get sd
sumTable(dat~g1*g2,data=d,FUN=sd,digits=1)  # show digits= argument

## Also demonstrate use in the 1-way example -- but see Summarize() in FSA package
sumTable(dat~g1,data=d,FUN=validn)
sumTable(dat~g1,data=d,FUN=mean)

## Example with a missing value (compare to above)
d$dat[1] <- NA
sumTable(dat~g1,data=d,FUN=validn)  # note use of validn
sumTable(dat~g1,data=d,FUN=mean,na.rm=TRUE)




