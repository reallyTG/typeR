library(highfrequency)


### Name: aggregateQuotes
### Title: Aggregate an xts object containing quote data
### Aliases: aggregateQuotes
### Keywords: data manipulation

### ** Examples

#load data
data("sample_qdata");
#aggregate quote data to the 30 second frequency
xx = aggregateQuotes(sample_qdata,on="seconds",k=30);
head(xx);



