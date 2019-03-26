library(simPop)


### Name: calibSample
### Title: Calibrate sample weights
### Aliases: calibSample
###   calibSample,df_or_dataObj_or_simPopObj,dataFrame_or_Table-method
### Keywords: methods survey

### ** Examples

data(eusilcS)
eusilcS$agecut <- cut(eusilcS$age, 7)
inp <- specifyInput(data=eusilcS, hhid="db030", hhsize="hsize", strata="db040", weight="db090")

## for simplicity, we are using population data directly from the sample, but you get the idea
totals1 <- tableWt(eusilcS[, c("agecut","rb090")], weights=eusilcS$rb050)
totals2 <- tableWt(eusilcS[, c("rb090","agecut")], weights=eusilcS$rb050)
totals3 <- tableWt(eusilcS[, c("rb090","agecut","db040")], weights=eusilcS$rb050)
totals4 <- tableWt(eusilcS[, c("agecut","db040","rb090")], weights=eusilcS$rb050)

weights1 <- calibSample(inp, totals1)
totals1.df <- as.data.frame(totals1)
weights1.df <- calibSample(inp, totals1.df)
identical(weights1, weights1.df)

# we can also use a data.frame and an optional weight vector as input
df <- as.data.frame(inp@data)
w <- inp@data[[inp@weight]]
weights1.x <- calibSample(df, totals1.df, w=inp@data[[inp@weight]])
identical(weights1, weights1.x)

weights2 <- calibSample(inp, totals2)
totals2.df <- as.data.frame(totals2)
weights2.df <- calibSample(inp, totals2.df)
identical(weights2, weights2.df)

## Not run: 
##D ## approx 10 seconds computation time ...
##D weights3 <- calibSample(inp, totals3)
##D totals3.df <- as.data.frame(totals3)
##D weights3.df <- calibSample(inp, totals3.df)
##D identical(weights3, weights3.df)
##D 
##D ## approx 10 seconds computation time ...
##D weights4 <- calibSample(inp, totals4)
##D totals4.df <- as.data.frame(totals4)
##D weights4.df <- calibSample(inp, totals4.df)
##D identical(weights4, weights4.df)
## End(Not run)



