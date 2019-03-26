library(highfrequency)


### Name: convert
### Title: Convert trade or quote data into xts object saved in the RData
###   format
### Aliases: convert

### ** Examples

#In order for these examples to work, the folder datasource 
#should contain two folders named 2008-01-02 and 2008-01-03.
#These folder contain the files with the trade data,
#which are named "AAPL_trades.txt" or "AA_trades.txt".

from="2008-01-02";
to = "2008-01-03";
## Not run: 
##D datasource=datadestination="C:\data"
##D 
##D ### txt files from NYSE:
##D 
##D convert(from,to,datasource,datadestination,trades=TRUE,
##D           quotes=FALSE,ticker=c("AA","AAPL"),dir=FALSE,extension="txt",
##D           header=FALSE,tradecolnames=NULL,quotecolnames=NULL,
##D           format="%Y%m%d %H:%M:%S");
##D 
##D #Now, the folder datadestination will contain two folders
##D #named 2008-01-02 and 2008-01-03 containing 
##D #the files AAPL_trades.RData and AAPL_trades.RData containing the trades.
##D #The data can now be loaded with the TAQLoad function.
##D 
##D ########## Csv file from WRDS
##D #Suppose the datasource folder contains one csv file from WRDS 
##D #with data on IBM for multiple days.
##D #The file should be named "IBM_trades.csv" and can be easily converted into xts 
##D #and then saved in RData format by:
##D 
##D convert(from=from, to=to, datasource=datasource, datadestination=datadestination, 
##D     trades = T, quotes = T, ticker="IBM", dir = FALSE, extension = "csv", 
##D     header = TRUE, tradecolnames = NULL, quotecolnames = NULL, format = format, 
##D     onefile = TRUE )  
##D 
##D ####### ASC file from www.tickdata.com
##D #Suppose the datasource folder contains asc files for trades and quotes 
##D #from "www.tickdata.com" for GLP. 
##D #The files "GLP_quotes.asc" and "GLP_trades.asc" should be saved in datasource folder.
##D 
##D  convert(from=from, to=to, datasource=datasource, datadestination=datadestination, 
##D     trades = T, quotes = T, ticker="GLP", dir = TRUE, extension = "tickdatacom", 
##D     header = TRUE, tradecolnames = NULL, quotecolnames = NULL, format = "##D 
##D     onefile = TRUE );  
## End(Not run)



