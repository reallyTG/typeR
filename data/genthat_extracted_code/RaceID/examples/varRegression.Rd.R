library(RaceID)


### Name: varRegression
### Title: Linear Regression of Sources of Variability
### Aliases: varRegression

### ** Examples

sc <- SCseq(intestinalDataSmall)
sc <- filterdata(sc)
b <- sub("(\\_\\d+)$","",colnames(intestinalData))
vars <- data.frame(row.names=colnames(intestinalData),batch=b)
sc   <- varRegression(sc,vars)



