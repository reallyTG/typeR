library(FSA)


### Name: histFromSum
### Title: Create a histogram from a frequency table.
### Aliases: histFromSum histFromSum.default histFromSum.formula
###   histFromSum.table
### Keywords: hplot

### ** Examples

## Make some dummy data with a length category variable
set.seed(634434789)
df <- data.frame(tl=round(rnorm(100,100,20)))
df$lcat10 <- lencat(df$tl,w=10)

## Summarize as tables
( tbl1 <- xtabs(~lcat10,data=df) )
( tbl2 <- table(df$lcat10) )

## Turn the tables into a data.frame for testing (convert
## the categories variables to numeric with fact2num())
df2 <- data.frame(tbl1)
df2$lcat10 <- fact2num(df2$lcat10)

## Turn the table into a matrix for testing
( mat1 <- cbind(lcat10=as.numeric(rownames(tbl1)),freq=tbl1) )

## Histogram of the raw data ... set breaks and x-axis label
brks <- seq(20,160,10)
xlbl <- "Total Length (mm)"
hist(~tl,data=df,breaks=brks,xlab=xlbl)

## Use this function with various inputs ... changed colors
## on each plot so that it was obvious that a new plot was made.
# table from xtabs()
histFromSum(tbl1,breaks=brks,xlab=xlbl,col="gray75")
# table from table()
histFromSum(tbl2,breaks=brks,xlab=xlbl,col="gray70")
# vectors from data.frame
histFromSum(df2$lcat10,df2$Freq,breaks=brks,xlab=xlbl,col="gray65")
# vectors from matrix
histFromSum(mat1[,"lcat10"],mat1[,"freq"],breaks=brks,xlab=xlbl,col="gray60")
# formula from a data.frame
histFromSum(Freq~lcat10,data=df2,breaks=brks,xlab=xlbl,col="gray55")




