### R code from vignette source 'Guide.Stex'

###################################################
### code chunk number 1: Guide.Stex:30-31
###################################################
options(continue="  ")


###################################################
### code chunk number 2: Guide.Stex:49-51
###################################################
library("tframe")  
library("tfplot")  


###################################################
### code chunk number 3: Guide.Stex:250-259
###################################################
library("TSsdmx")  
oecd <- TSconnect("sdmx", dbname="OECD")

x <- TSget('QNA.CAN.B1_GE.CARSA.Q', oecd)

tfplot(x, title="Canada: GDP - expenditure approach", 
    subtitle="quarterly national accounts, national currency, current prices, SAAR",
    ylab="CDN dollars")



###################################################
### code chunk number 4: Guide.Stex:267-274
###################################################
x <- TSget('QNA.CAN+USA+MEX.B1_GE.CARSA.Q', 
         names=c("Canada", "United States", "Mexico"),   oecd)

tfOnePlot(ytoypc(x), title="Nominal GDP  - expenditure approach", 
         subtitle="quarterly national accounts, national currency, current prices, SAAR",
	 ylab="national currency", start=c(1975,1),
	 legend=seriesNames(x), legend.loc="topright")


###################################################
### code chunk number 5: Guide.Stex:299-304
###################################################
eurostat <- TSconnect("sdmx", dbname="EUROSTAT")
ecb <- TSconnect("sdmx", dbname="ECB")
abs <- TSconnect("sdmx", dbname="ABS")

 z <- TSget("ei_nama_q.Q.MIO-EUR.NSA.CP.NA-P72.IT", eurostat)


###################################################
### code chunk number 6: Guide.Stex:309-313
###################################################
z <- TSget('EXR.Q.USD.EUR.SP00.A', 
                start="2008-Q2", end="2014-Q3", ecb)
z <- TSget('EXR.Q.USD.EUR.SP00.A', 
                start=c(2008,2), end=c(2014,3), ecb)


###################################################
### code chunk number 7: Guide.Stex:330-332
###################################################
options(TSconnection=abs)
z <- TSget("BOP.1.100.10.Q", start=c(1990, 1), end=c(2012, 2)) 


###################################################
### code chunk number 8: Guide.Stex:337-338
###################################################
options(TSconnection=NULL)


###################################################
### code chunk number 9: Guide.Stex:345-349
###################################################
class(z)
z <- TSget("BOP.1.100.10.Q", start=c(1990, 1), end=c(2012, 2), 
                 abs, TSrepresentation="zoo")
class(z)


###################################################
### code chunk number 10: Guide.Stex:353-354
###################################################
options(TSrepresentation="zoo")


###################################################
### code chunk number 11: Guide.Stex:358-359
###################################################
options(TSrepresentation=NULL)


###################################################
### code chunk number 12: Guide.Stex:375-380
###################################################
library("TSmisc")  
yahoo <- TSconnect("histQuote", dbname="yahoo") 
x <- TSget("^gspc", quote = "Close", con=yahoo)
library("tfplot")  
tfplot(x)


###################################################
### code chunk number 13: Guide.Stex:387-390
###################################################
yahoo <- TSconnect("getSymbol", dbname="yahoo") 
x <- TSget("^gspc", quote = "Close", con=yahoo)
tfplot(x)


###################################################
### code chunk number 14: Guide.Stex:402-406
###################################################
ya1 <- TSconnect("getSymbol", dbname="yahoo")
ya2 <- TSconnect("histQuote", dbname="yahoo")
ibmC1 <- TSget("ibm", ya1, quote = "Close", start="2011-01-03")
ibmC2 <- TSget("ibm", ya2, quote = "Close", start="2011-01-03")


###################################################
### code chunk number 15: Guide.Stex:417-418
###################################################
tframe(ibmC1) <- as.Date(tframe(ibmC1))


###################################################
### code chunk number 16: Guide.Stex:422-428
###################################################
tfplot(ibmC2, ibmC1,  
   ylab="IBM Close",
   title="IBM via getSymbol and histQuote",
   lastObs=TRUE, 
   legend=c("via histQuote (black)", "via getSymbol (red)"),
   source="Source: Yahoo")


###################################################
### code chunk number 17: Guide.Stex:432-433
###################################################
max(abs(ibmC2 - ibmC1))


###################################################
### code chunk number 18: Guide.Stex:444-448
###################################################
TSdescription(x) 
TSdoc(x) 
TSlabel(x) 
TSsource(x) 


###################################################
### code chunk number 19: Guide.Stex:458-461
###################################################
library("TSmisc")  
fred <- TSconnect("getSymbol", dbname="FRED") 
tfplot(TSget("M2", fred))


###################################################
### code chunk number 20: Guide.Stex:466-474
###################################################
tfOnePlot(percentChange(TSget("M2", fred), lag=52), 
    title = "Running commentary, blah, blah, blah", 
    subtitle="Broad Money (M2)",
    ylab= "y/y percent change*",
    source="Source: Federal Reserve Bank of St.Louis (M2)",
    footnoteLeft = "seasonally adjusted data",
    footnoteRight = "* approximated by 52 week growth",
    lastObs = TRUE )


###################################################
### code chunk number 21: Guide.Stex:480-491
###################################################
x <- TSget(c("CPIAUCNS","M2SL"), fred)
tfplot(x, 
    title = "Running commentary, blah, blah, blah", 
    subtitle=c("Consumer Price Index for All Urban Consumers: All Items",
               "Broad Money"),
    ylab= c("Index 1982-84=100", "Billions of dollars"),
    source= c("Data Source: Federal Reserve Bank of St.Louis (CPIAUCNS)",
              "Data Source: Federal Reserve Bank of St.Louis (M2SL)"),
    footnoteLeft  = c("not seasonally adjusted",  "seasonally adjusted"),
    footnoteRight = paste("Extracted:", date()),
    lastObs = TRUE )


###################################################
### code chunk number 22: Guide.Stex:495-496
###################################################
TSdates(c("CPIAUCNS","M2SL"), fred) 


###################################################
### code chunk number 23: Guide.Stex:501-503
###################################################
x <- TSget(c("CPIAUCNS","M2SL"), fred, TSrepresentation="zoo")
class(x) 


###################################################
### code chunk number 24: Guide.Stex:508-511
###################################################
yahoo <- TSconnect("getSymbol", dbname="yahoo") 
x <- TSget("F", con=yahoo)
plot(x)


###################################################
### code chunk number 25: Guide.Stex:524-525
###################################################
tfplot(x,series=1:3)


###################################################
### code chunk number 26: Guide.Stex:535-538
###################################################
tfOnePlot(TSget("F", con=yahoo, quote=c("Open", "Close")),
     title="Ford from Yahoo;  Open (black); Close (red)",
     ylab="Price")


###################################################
### code chunk number 27: Guide.Stex:565-574 (eval = FALSE)
###################################################
## require('findpython')
## 
## cmdExists <- can_find_python_cmd(
##     minimum_version = '2.6',
##     maximum_version = '2.9',
##     required_modules = c('sys', 're', 'urllib2', 'csv', 'mechanize', 'json')
##     )
## 
## if (!cmdExists)  stop('adequate python was not found. ')


###################################################
### code chunk number 28: Guide.Stex:596-598 (eval = FALSE)
###################################################
## require("TSjson")
## cansim <- TSconnect("json", dbname="cansim")


###################################################
### code chunk number 29: Guide.Stex:604-606 (eval = FALSE)
###################################################
## x <- TSget("v498086", cansim)
## tfplot(x)


###################################################
### code chunk number 30: Guide.Stex:610-614 (eval = FALSE)
###################################################
## TSdescription("v498086", cansim)
## TSdoc("v498086", cansim)
## TSlabel("v498086", cansim)
## TSsource("v498086", cansim)


###################################################
### code chunk number 31: Guide.Stex:620-625 (eval = FALSE)
###################################################
## tfplot(ytoypc(x), start=c(1975,1),
##    ylab="Year-to-Year Growth Rate",
##    title="Canadian GDP", 
##    source=paste("Statistics Canada ", seriesNames(x)),
##    lastObs=TRUE)


###################################################
### code chunk number 32: Guide.Stex:634-637 (eval = FALSE)
###################################################
## oldpar <- par(omi=c(0.1,0.1,0.1,0.1),mar=c(3.1,4.1,0.6,0.1))
## tfplot(ytoypc(TSget(c("v498086", "v498087"), cansim)))
## par(oldpar)


###################################################
### code chunk number 33: Guide.Stex:643-644 (eval = FALSE)
###################################################
## TSdates(c("v498086", "v498087"), cansim)


###################################################
### code chunk number 34: Guide.Stex:650-665 (eval = FALSE)
###################################################
## resMorg <- TSget("V122746", cansim, TSdescription=TRUE, 
##                    TSdoc=TRUE, TSlabel=TRUE)
## TSdescription(resMorg)
## TSdoc(resMorg)
## TSlabel(resMorg)
## TSseriesIDs(resMorg)
## TSsource(resMorg)
## seriesNames(resMorg) <- "Residential Mortgage Credit (SA)"
## 
## tfplot(ytoypc(resMorg), annualizedGrowth(resMorg),
##    title=seriesNames(resMorg), 
##    subtitle="year-to-year (black) and annualize monthly growth (red)",
##    ylab="Growth Rate",
##    source=paste("Bank of Canada, ", TSsource(x)),
##    lastObs=TRUE)


###################################################
### code chunk number 35: Guide.Stex:682-692
###################################################
library("TSmisc")  
rba <- TSconnect("xls", dbname=
      "http://www.rba.gov.au/statistics/tables/xls/d03hist.xls",
    map=list(ids  =list(i=11,     j="B:Q"), 
	           data =list(i=12:627, j="B:Q"), 
	           dates=list(i=12:627, j="A"),
                   names=list(i=4:7,    j="B:Q"), 
		   description = NULL,
		   tsrepresentation = function(data,dates){
		       ts(data,start=c(1959,7), frequency=12)}))


###################################################
### code chunk number 36: Guide.Stex:710-713
###################################################
x <- TSget("DMACN", rba)
require("tfplot")
tfplot(x)


###################################################
### code chunk number 37: Guide.Stex:716-719
###################################################
x <- TSget(c("DMAM1N", "DMAM3N"), rba)
tfplot(x)
TSdescription(x) 


###################################################
### code chunk number 38: Guide.Stex:734-738
###################################################
tfplot(TSget(c("DMAM1S", "DMAM3S", "DMABMS"), rba),
         TSget(c("DMAM1N", "DMAM3N", "DMABMN"), rba),
    ylab=c("DMAM1", "DMAM3", "DMABM"),
    title="Australian Monetary Aggregates")


###################################################
### code chunk number 39: Guide.Stex:752-756
###################################################
library("TSmisc")  
pitr <- TSconnect("zip", dbname="http://pitrading.com/free_eod_data")
z <- TSget("INDU", pitr)
tfplot(z, series=c(1,4))


###################################################
### code chunk number 40: Guide.Stex:760-767
###################################################
require("xts")
z <- TSget(c("EURUSD", "GBPUSD"), pitr, quote=c("Open","Close"),
       TSrepresentation=xts)
tfplot(z,
       title="EURUSD and GBPUSD open and closing values from pitrading", 
       start="1995-01-01",
       par=list(omi=c(0.1,0.3,0.1,0.1),mar=c(2.1,3.1,1.0,0.1)))


###################################################
### code chunk number 41: Guide.Stex:809-814
###################################################
setup <- RMySQL::dbConnect(RMySQL::MySQL(), dbname="test")  
TSsql::removeTSdbTables(setup, yesIknowWhatIamDoing=TRUE)
TSsql::createTSdbTables(setup, index=FALSE)
DBI::dbListTables(setup) 
DBI::dbDisconnect(setup)


###################################################
### code chunk number 42: Guide.Stex:829-831
###################################################
library("TSMySQL")
con <- TSconnect("MySQL", dbname="test") 


###################################################
### code chunk number 43: Guide.Stex:843-848
###################################################
z <- ts(rnorm(10), start=c(1990,1), frequency=1)
seriesNames(z) <- "vec"
if(TSexists("vec", con)) TSdelete("vec", con) 
TSput( z, con)
z <- TSget("vec", con)


###################################################
### code chunk number 44: Guide.Stex:871-876
###################################################
z <- ts(matrix(rnorm(200),100,2), start=c(1995,1), frequency=12)
 seriesNames(z) <- c("mat2c1", "mat2c2")
TSreplace(z, con)
tfplot(z+1, TSget(c("mat2c1","mat2c2"), con),
	  lty=c("solid", "dashed"), col=c("black", "red"))


###################################################
### code chunk number 45: Guide.Stex:881-887
###################################################
TSmeta("mat2c1", con)
TSmeta("vec", con)
TSdates("vec", con)
TSdescription("vec", con)
TSdoc("vec", con)
TSlabel("vec", con)


###################################################
### code chunk number 46: Guide.Stex:904-918
###################################################
z <- ts(matrix(rnorm(10),10,1), start=c(1990,1), frequency=1)
TSreplace(z, serIDs="Series1", con) 
zz <- TSget("Series1", con)
TSreplace(z, serIDs="Series1", con, 
    TSdescription="short rnorm series", 
    TSdoc="Series created as an example in the vignette.")
zz <- TSget("Series1", con, TSdescription=TRUE, TSdoc=TRUE)
start(zz)
end(zz)
TSdescription(zz)
TSdoc(zz)

TSdescription("Series1", con)
TSdoc("Series1", con)


###################################################
### code chunk number 47: Guide.Stex:927-935
###################################################
require("zoo") 

z <- zoo(matrix(rnorm(200),100,2), as.Date("1990-01-01") + 0:99)
 seriesNames(z) <- c("zooc1", "zooc2")
TSreplace(z, con, Table="D")
tfplot(z+1, TSget(c("zooc1","zooc2"), con),
	  lty=c("solid", "dashed"), col=c("black", "red"))
 


###################################################
### code chunk number 48: Guide.Stex:938-941
###################################################
z <- zoo(matrix(rnorm(200),100,2), as.Date("1990-01-01") + 0:99 * 7)
seriesNames(z) <- c("zooWc1", "zooWc2")
TSreplace(z, con, Table="W")


###################################################
### code chunk number 49: Guide.Stex:944-946
###################################################
dbDisconnect(con)
detach(package:TSMySQL)


###################################################
### code chunk number 50: Guide.Stex:968-972
###################################################
host	<- Sys.getenv("POSTGRES_HOST")
setup <-  DBI::dbConnect(RPostgreSQL::PostgreSQL(), dbname="test", host=host) 
TSsql::createTSdbTables(setup)
DBI::dbDisconnect(setup)


###################################################
### code chunk number 51: Guide.Stex:976-978
###################################################
require("TSPostgreSQL")
con <-  TSconnect("PostgreSQL", dbname="test", host=host) 


###################################################
### code chunk number 52: Guide.Stex:983-986
###################################################
require("TSmisc")
yahoo <- TSconnect("histQuote", dbname="yahoo") 
x <- TSget("^gspc", quote = "Close", con=yahoo)


###################################################
### code chunk number 53: Guide.Stex:993-994
###################################################
TSreplace(x,  serIDs="gspc", Table="B", con=con)


###################################################
### code chunk number 54: Guide.Stex:999-1003
###################################################
TSrefperiod(TSget(serIDs="gspc", con=con)) 
TSdescription("gspc", con=con) 
TSdoc("gspc", con=con)
tfplot(TSget(serIDs="gspc", con=con))


###################################################
### code chunk number 55: Guide.Stex:1006-1019
###################################################
x <- TSget("ibm", quote = c("Close", "Vol"), con=yahoo)
TSreplace(x, serIDs=c("ibm.Cl", "ibm.Vol"),  con=con, Table="B",
	   TSdescription.=c("IBM Close","IBM  Volume"),
     	   TSdoc.= paste(c(
     	      "IBM  Close   retrieved on ",
     	      "IBM  Volume retrieved  on "), Sys.Date()))

z <- TSget(serIDs=c("ibm.Cl", "ibm.Vol"), 
	  TSdescription=TRUE, TSdoc=TRUE, con=con)
TSdescription(z)
TSdoc(z)
tfplot(z, xlab = TSdoc(z), title = TSdescription(z))
tfplot(z, title="IBM", start="2007-01-01")


###################################################
### code chunk number 56: Guide.Stex:1056-1059
###################################################
Oanda <- TSconnect("histQuote", dbname="oanda") 
x <- TSget("EUR/USD", start=Sys.Date() - 495, con=Oanda)
TSreplace(x, serIDs="EUR/USD", Table="D", con=con)


###################################################
### code chunk number 57: Guide.Stex:1064-1068
###################################################
z <- TSget(serIDs="EUR/USD",TSlabel=TRUE, 
	       TSdescription=TRUE,  con=con)
tfplot(z, title = TSdescription(z), ylab=TSlabel(z),
	 start="2007-03-01")


###################################################
### code chunk number 58: Guide.Stex:1071-1075
###################################################
dbDisconnect(con)
dbDisconnect(yahoo)
dbDisconnect(Oanda)
detach(package:TSPostgreSQL)


###################################################
### code chunk number 59: Guide.Stex:1186-1190
###################################################
library("TScompare")  
library("TSmisc")  
library("TSMySQL")  
library("TSSQLite")  


###################################################
### code chunk number 60: Guide.Stex:1199-1210
###################################################
setup <- RMySQL::dbConnect(RMySQL::MySQL(), dbname="test")  
TSsql::removeTSdbTables(setup, yesIknowWhatIamDoing=TRUE)
TSsql::createTSdbTables(setup, index=FALSE)
DBI::dbListTables(setup) 
DBI::dbDisconnect(setup)

setup <- RSQLite::dbConnect(RSQLite::SQLite(), dbname="test")  
TSsql::removeTSdbTables(setup, yesIknowWhatIamDoing=TRUE)
TSsql::createTSdbTables(setup, index=FALSE)
DBI::dbListTables(setup) 
DBI::dbDisconnect(setup)


###################################################
### code chunk number 61: Guide.Stex:1214-1216
###################################################
con1 <- TSconnect("MySQL", dbname="test")
con2 <- TSconnect("SQLite", dbname="test") 


###################################################
### code chunk number 62: Guide.Stex:1228-1237
###################################################
yahoo <- TSconnect("histQuote", dbname="yahoo") 

x <- TSget("^gspc", yahoo)
TSreplace(x,  serIDs="gspc", Table="B", con=con1)
TSreplace(x,  serIDs="gspc", Table="B", con=con2)

x <- TSget("ibm", con=yahoo, quote = c("Close", "Vol"))
TSreplace(x, serIDs=c("ibmClose", "ibmVol"), Table="B", con=con1)
TSreplace(x, serIDs=c("ibmC",	  "ibmV"),   Table="B", con=con2)


###################################################
### code chunk number 63: Guide.Stex:1241-1243
###################################################
ids <- AllIds(con1)
ids


###################################################
### code chunk number 64: Guide.Stex:1249-1256
###################################################
ids <- cbind(ids, ids)

eq   <- TScompare(ids, con1, con2, na.rm=FALSE)
summary(eq)

eqrm <- TScompare(ids, con1, con2, na.rm=TRUE)
summary(eqrm)


###################################################
### code chunk number 65: Guide.Stex:1263-1272
###################################################
ids <- matrix(c("gspc","ibmClose", "ibmVol",
		"gspc","ibmC", "ibmV"),3,2)

ids
eq   <- TScompare(ids, con1, con2, na.rm=FALSE)
summary(eq)

eqrm <- TScompare(ids, con1, con2, na.rm=TRUE)
summary(eqrm)


###################################################
### code chunk number 66: Guide.Stex:1277-1282
###################################################
dbDisconnect(con1)
dbDisconnect(con2)
dbDisconnect(yahoo)
detach(package:TSMySQL)
detach(package:TSSQLite)


###################################################
### code chunk number 67: Guide.Stex:1307-1311 (eval = FALSE)
###################################################
## require("TSMySQL") 
## require("tfplot") 
## ets <- TSconnect("MySQL",dbname="etsv") 
## v  <- TSvintages(ets)


###################################################
### code chunk number 68: Guide.Stex:1318-1319 (eval = FALSE)
###################################################
## ve <- TSexists("V122707", vintage=v, con=ets)


###################################################
### code chunk number 69: Guide.Stex:1323-1324 (eval = FALSE)
###################################################
## ve[224:length(ve)] <- FALSE 


###################################################
### code chunk number 70: Guide.Stex:1328-1334 (eval = FALSE)
###################################################
## CC <- TSget(serIDs="V122707", con=ets, vintage=v[ve])
## 
## tfOnePlot(ytoypc(CC), start=c(2000,1), 
##    ylab="Consumer Credit (V122707) y/y Growth",
##    title=paste("Vintages", v[ve][1], "to",  v[ve][189]),
##    lastObs=TRUE, source="Source: Bank of Canada")


###################################################
### code chunk number 71: Guide.Stex:1342-1350 (eval = FALSE)
###################################################
## dbs <- paste("ets /path/to/etsmfacansim_", c(
## 	   "20110513.db", "20060526.db", "20110520.db"), sep="")
## names(dbs) <- c("2011-05-13", "2006-05-26", "2011-05-20")
##            
## conetsV <-TSconnect("fame", dbname=dbs, "read", current="2011-05-13")
## 
## z <- TSget("V122646", con=conetsV, vintage=c("2011-05-13", "2006-05-26"))
## dbDisconnect(conetsV)


###################################################
### code chunk number 72: Guide.Stex:1363-1366 (eval = FALSE)
###################################################
## require("googleVis") 
## tfVisPlot(ytoypc(CC, names=seriesNames(CC)), start=c(2006,1),
##     options=list(title="Vintages of Consumer Credit (V122707) y/y Growth"))


###################################################
### code chunk number 73: Guide.Stex:1374-1376 (eval = FALSE)
###################################################
## dbDisconnect(ets)
## detach(package:TSMySQL)


###################################################
### code chunk number 74: Guide.Stex:1396-1404
###################################################
library("TSsdmx") 
 
# RJSDMX::sdmxHelp()  # can be useful for finding series identifiers, etc

oecd <- TSconnect("sdmx", dbname="OECD")

x <- TSget('QNA.CAN|MEX|USA|.B1_GE.CARSA.Q', oecd)



###################################################
### code chunk number 75: Guide.Stex:1416-1422
###################################################
library("tframePlus")
library("tfplot")

tfplot(x, title="Nominal GDP at PPP? (relative to US)", 
         subtitle=paste(c("Canada","Mexico","US"),"quarterly national accounts, SAAR"),
	 ylab=rep("guess the units",3))


###################################################
### code chunk number 76: Guide.Stex:1429-1432
###################################################
start(x)
x <- trimNA(x, endNAs=FALSE)
start(x)


###################################################
### code chunk number 77: Guide.Stex:1441-1442
###################################################
x <- tfwindow(x, start=c(1995,1))


###################################################
### code chunk number 78: Guide.Stex:1448-1452
###################################################
library("WriteXLS")
tofile <- tempfile(fileext = ".xls")
TSwriteXLS(x, FileName=tofile)
unlink(tofile) 


###################################################
### code chunk number 79: Guide.Stex:1461-1462 (eval = FALSE)
###################################################
## ?TSwriteXLS


###################################################
### code chunk number 80: Guide.Stex:1473-1476
###################################################
tofile <- tempfile(fileext = ".csv")
TSwriteCSV(x, FileName=tofile)
unlink(tofile) 


