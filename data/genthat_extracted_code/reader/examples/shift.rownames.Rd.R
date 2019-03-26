library(reader)


### Name: shift.rownames
### Title: Shift the first column of a dataframe to rownames() if
###   appropriate.
### Aliases: shift.rownames

### ** Examples

df1 <- data.frame(ID=paste("ID",101:110,sep=""),
                   scores=sample(70,10,TRUE)+30,age=sample(7,10,TRUE)+11)
shift.rownames(df1)
df2 <- data.frame(ID=paste(101:110),
                   scores=sample(70,10,TRUE)+30,age=sample(7,10,TRUE)+11)
shift.rownames(df2) # first col are all numbers, so no convert
shift.rownames(df2,override=TRUE) # override forces conversion



