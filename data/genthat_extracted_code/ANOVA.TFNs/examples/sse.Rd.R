library(ANOVA.TFNs)


### Name: sse
### Title: Sum of Squares within treatments (Errors) for crisp observation
### Aliases: sse
### Keywords: crisp.Data sst sstr sse mstr mse f sse.fuzzy mse.fuzzy FANOVA
###   ANOVA

### ** Examples

data(Data)

sse( Data )
sse( Data, "L" )

## No test: 
 ### Checking relation  sst = sstr + sse 
## End(No test)
sst(Data) == sstr(Data) + sse(Data)
sst(Data, "L") == sstr(Data, "L") + sse(Data, "L")




