library(ANOVA.TFNs)


### Name: means.vec
### Title: Computing means vector for each population
### Aliases: means.vec
### Keywords: plotTFNs sst.fuzzy sstr.fuzzy sse.fuzzy FANOVA

### ** Examples

data(Data)

means.vec(Data)

## No test: 
 # Computing the waighted mean of mean populations: 
## End(No test)
data.. = ( means.vec(Data)[1,]*n(Data)[1] + 
	   means.vec(Data)[2,]*n(Data)[2] +
	   means.vec(Data)[3,]*n(Data)[3] ) / sum(n(Data))
round(data..,3)



