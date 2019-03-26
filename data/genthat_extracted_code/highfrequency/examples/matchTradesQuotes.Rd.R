library(highfrequency)


### Name: matchTradesQuotes
### Title: Match trade and quote data
### Aliases: matchTradesQuotes
### Keywords: data manipulation

### ** Examples

#load data samples
data("sample_tdata");
data("sample_qdata");
#match the trade and quote data
tqdata = matchTradesQuotes(sample_tdata,sample_qdata);
#have a look
head(tqdata);



