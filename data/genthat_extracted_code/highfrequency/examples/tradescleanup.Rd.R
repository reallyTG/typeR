library(highfrequency)


### Name: tradesCleanup
### Title: Cleans trade data
### Aliases: tradesCleanup
### Keywords: cleaning

### ** Examples

#Consider you have raw trade data for 1 stock for 1 day 
data("sample_tdataraw");
head(sample_tdataraw);
dim(sample_tdataraw);
tdata_afterfirstcleaning = tradesCleanup(tdataraw=sample_tdataraw,exchanges=list("N") );
tdata_afterfirstcleaning$report; 
barplot(tdata_afterfirstcleaning$report);
dim(tdata_afterfirstcleaning$tdata);

#In case you have more data it is advised to use the on-disk functionality
#via "from","to","datasource",etc. arguments



