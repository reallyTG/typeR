library(XML)


### Name: readHTMLTable
### Title: Read data from one or more HTML tables
### Aliases: readHTMLTable readHTMLTable,character-method
###   readHTMLTable,HTMLInternalDocument-method
###   readHTMLTable,XMLInternalElementNode-method
###   coerce,character,FormattedInteger-method
###   coerce,character,FormattedNumber-method
###   coerce,character,Percent-method coerce,character,Currency-method
###   FormattedInteger-class FormattedNumber-class Percent-class
### Keywords: IO data

### ** Examples

## Not run: 
##D ## This changed to using https: in June 2015, and that is unsupported.
##D # u = "http://en.wikipedia.org/wiki/World_population"
##D  u = "https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population"
##D 
##D  tables = readHTMLTable(u)
##D  names(tables)
##D 
##D  tables[[2]]
##D   # Print the table. Note that the values are all characters
##D   # not numbers. Also the column names have a preceding X since
##D   # R doesn't allow the variable names to start with digits.
##D  tmp = tables[[2]]
##D 
##D 
##D    # Let's just read the second table directly by itself.
##D  doc = htmlParse(u)
##D  tableNodes = getNodeSet(doc, "//table")
##D  tb = readHTMLTable(tableNodes[[2]])
##D 
##D   # Let's try to adapt the values on the fly.
##D   # We'll create a function that turns a th/td node into a val
##D  tryAsInteger = function(node) {
##D                   val = xmlValue(node)
##D                   ans = as.integer(gsub(",", "", val))
##D                   if(is.na(ans))
##D                       val
##D                   else
##D                       ans
##D                 }
##D 
##D  tb = readHTMLTable(tableNodes[[2]], elFun = tryAsInteger)
##D 
##D  tb = readHTMLTable(tableNodes[[2]], elFun = tryAsInteger,
##D                        colClasses = c("character", rep("integer", 9)))
## End(Not run)

zz =
  readHTMLTable("https://www.inflationdata.com/Inflation/Consumer_Price_Index/HistoricalCPI.aspx")
if(any(i <- sapply(zz, function(x) if(is.null(x)) 0 else ncol(x)) == 14)) {
  # guard against the structure of the page changing.
    zz = zz[[which(i)[1]]]  # 4th table
    # convert columns to numeric.  Could use colClasses in the call to readHTMLTable()
    zz[-1] = lapply(zz[-1], function(x) as.numeric(gsub(".* ", "", as.character(x))))
    matplot(1:12, t(zz[-c(1, 14)]), type = "l")
}


# From Marsh Feldman on R-help, possibly
# https://stat.ethz.ch/pipermail/r-help/2010-March/232586.html
# That site was non-responsive in June 2015,
# and this does not do a good job on the current table.

doc <- "http://www.nber.org/cycles/cyclesmain.html"
# The  main table is the second one because it's embedded in the page table.
tables <- getNodeSet(htmlParse(doc), "//table")
xt <- readHTMLTable(tables[[2]],
                    header = c("peak","trough","contraction",
                               "expansion","trough2trough","peak2peak"),
                    colClasses = c("character","character","character",
                                   "character","character","character"),
                    trim = TRUE, stringsAsFactors = FALSE
                   )

if(FALSE) {
 # Here is a totally different way of reading tables from HTML documents.
 # The data are formatted using PRE and so can be read via read.table
 u = "http://tidesonline.nos.noaa.gov/data_read.shtml?station_info=9414290+San+Francisco,+CA"
 h = htmlParse(u)
 p = getNodeSet(h, "//pre")
 con = textConnection(xmlValue(p[[2]]))
 tides = read.table(con)
}

## Not run: 
##D ## This is not accessible without authentication ...
##D u = "http://www.omegahat.net/RCurl/testPassword/table.html"
##D if(require(RCurl) && url.exists(u)) {
##D   tt =  getURL(u, userpwd = "bob:duncantl")
##D   readHTMLTable(tt)
##D }
## End(Not run)



