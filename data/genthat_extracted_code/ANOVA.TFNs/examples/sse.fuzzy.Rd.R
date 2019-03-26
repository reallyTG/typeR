library(ANOVA.TFNs)


### Name: sse.fuzzy
### Title: Sum of Squares within treatments (Errors) for Triangular Fuzzy
###   observation
### Aliases: sse.fuzzy
### Keywords: sse mse sst.fuzzy sstr.fuzzy sse.fuzzy mstr.fuzzy mse.fuzzy
###   f.fuzzy FANOVA

### ** Examples


# Example 1: 
data(Data)

sse.fuzzy( Data )  ## No test: 
 # For m=1 
## End(No test)
sse.fuzzy( Data, m=2)

# Example 2  ( Checking relation  sst = sstr + sse  for different m):
sst.fuzzy(Data) == sstr.fuzzy(Data) + sse.fuzzy(Data)
sst.fuzzy(Data, m=3) == sstr.fuzzy(Data, m=3) + sse.fuzzy(Data, m=3)

for(m in 1:10) 
  print( round(sst.fuzzy(Data, m), 10) == round(sstr.fuzzy(Data, m) + sse.fuzzy(Data, m), 10) )



