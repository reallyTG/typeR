library(highfrequency)


### Name: aggregateTrades
### Title: Aggregate an xts object containing trade data
### Aliases: aggregateTrades
### Keywords: data manipulation

### ** Examples

data("sample_tdata");
#aggregate trade data to 5 minute frequency
x = aggregateTrades(sample_tdata,on="minutes",k=5)
head(x);



