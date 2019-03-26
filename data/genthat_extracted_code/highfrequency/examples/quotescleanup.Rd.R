library(highfrequency)


### Name: quotesCleanup
### Title: Cleans quote data
### Aliases: quotesCleanup
### Keywords: cleaning

### ** Examples

#Consider you have raw quote data for 1 stock for 1 day 
#data("sample_qdataraw");
#head(sample_qdataraw);
#dim(sample_qdataraw);
#qdata_aftercleaning = quotesCleanup(qdataraw=sample_qdataraw,exchanges="N");
#qdata_aftercleaning$report; 
#barplot(qdata_aftercleaning$report);
#dim(qdata_aftercleaning$qdata);

#In case you have more data it is advised to use the on-disk functionality
#via "from","to","datasource",etc. arguments



