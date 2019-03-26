library(eeptools)


### Name: crosstabs
### Title: Build a list of crosstabulations from a dataset
### Aliases: crosstabs

### ** Examples

df<-data.frame(cbind(x=seq(1,3,by=1), y=sample(LETTERS[6:8],60,replace=TRUE)),
fac=sample(LETTERS[1:4], 60, replace=TRUE))
varnames<-c('Quality','Grade')
myCT <- crosstabs(df, rowvar = "x",colvar = "fac", varnames = varnames, digits =2)



