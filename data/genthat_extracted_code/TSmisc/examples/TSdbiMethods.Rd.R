library(TSmisc)


### Name: TSmiscMethods
### Title: TSdbi Extensions to Wrap Several Data Sources
### Aliases: TSmiscMethods histQuote TShistQuoteConnection-class
###   TSconnect,histQuoteConnection,missing-method
###   TSget,character,TShistQuoteConnection-method
###   TSdates,character,TShistQuoteConnection-method
###   TSdescription,character,TShistQuoteConnection-method
###   TSdoc,character,TShistQuoteConnection-method
###   TSlabel,character,TShistQuoteConnection-method
###   TSsource,character,TShistQuoteConnection-method getSymbol
###   TSgetSymbolConnection-class
###   TSconnect,getSymbolConnection,missing-method
###   TSget,character,TSgetSymbolConnection-method
###   TSdates,character,TSgetSymbolConnection-method
###   TSdescription,character,TSgetSymbolConnection-method
###   TSdoc,character,TSgetSymbolConnection-method
###   TSlabel,character,TSgetSymbolConnection-method
###   TSsource,character,TSgetSymbolConnection-method xls
###   TSxlsConnection-class TSconnect,xlsConnection,missing-method
###   TSget,character,TSxlsConnection-method
###   TSdates,character,TSxlsConnection-method
###   TSdescription,character,TSxlsConnection-method
###   TSdoc,character,TSxlsConnection-method
###   TSlabel,character,TSxlsConnection-method
###   TSsource,character,TSxlsConnection-method zip TSzipConnection-class
###   TSconnect,zipConnection,missing-method
###   TSget,character,TSzipConnection-method
###   TSdates,character,TSzipConnection-method
###   TSdescription,character,TSzipConnection-method
###   TSdoc,character,TSzipConnection-method
###   TSlabel,character,TSzipConnection-method
###   TSsource,character,TSzipConnection-method
### Keywords: ts

### ** Examples

 require("tfplot")
    
 ## Not run: 
##D     con <- try(TSconnect("histQuote", dbname="yahoo") )
##D     x <- TSget("^gspc", con)
##D     tfplot(x)
##D 
##D     con <- TSconnect("getSymbol", dbname="FRED")
##D     x <- TSget("CPIAUCNS", con)
##D     tfplot(x)
##D 
##D     # data from http://pitrading.com/
##D     # par(ask=TRUE) # to pause between pages
##D     con <- TSconnect("zip", dbname="http://pitrading.com/free_eod_data")
##D     x <- TSget("EURUSD", con)
##D     tfplot(x, graphs.per.page=3)
##D 
##D     z <- TSget(c("AD", "CD"), con, quote="Close")
##D     tfplot(z, start="2007-01-01", Title=
##D      "Futures, Australian and Canadian Dollar Continuous Contract at Close",
##D       graphs.per.page=3)
##D     
## End(Not run)

  ####  Australian Money ####
  #  test file copied Nov. 29, 2010 from 
  #  http://www.rba.gov.au/statistics/tables/xls/d03hist.xls  

    testfile <- system.file("xlsExampleData/d03hist.xls", package = "TSmisc")
 
    con1 <- TSconnect("xls", dbname=testfile,
          map=list(ids  =list(i=11,     j="B:Q"), 
	           data =list(i=12:627, j="B:Q"), 
	           dates=list(i=12:627, j="A"),
                   names=list(i=4:7,    j="B:Q"), 
		   description = NULL,
		   tsrepresentation = function(data,dates){
		       ts(data,start=c(1959,7), frequency=12)}))

    z <- TSget("DMACN", con1)
    tfplot(z)



