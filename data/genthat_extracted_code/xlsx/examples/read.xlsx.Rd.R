library(xlsx)


### Name: read.xlsx
### Title: Read the contents of a worksheet into an R data.frame
### Aliases: read.xlsx read.xlsx2

### ** Examples

## Not run: 
##D 
##D file <- system.file("tests", "test_import.xlsx", package = "xlsx")
##D res <- read.xlsx(file, 1)  # read first sheet
##D head(res)
##D #          NA. Population Income Illiteracy Life.Exp Murder HS.Grad Frost   Area
##D # 1    Alabama       3615   3624        2.1    69.05   15.1    41.3    20  50708
##D # 2     Alaska        365   6315        1.5    69.31   11.3    66.7   152 566432
##D # 3    Arizona       2212   4530        1.8    70.55    7.8    58.1    15 113417
##D # 4   Arkansas       2110   3378        1.9    70.66   10.1    39.9    65  51945
##D # 5 California      21198   5114        1.1    71.71   10.3    62.6    20 156361
##D # 6   Colorado       2541   4884        0.7    72.06    6.8    63.9   166 103766
##D # >
##D 
##D 
##D # To convert an Excel datetime colum to POSIXct, do something like:
##D #   as.POSIXct((x-25569)*86400, tz="GMT", origin="1970-01-01")
##D # For Dates, use a conversion like:
##D #   as.Date(x-25569, origin="1970-01-01") 
##D 
##D res2 <- read.xlsx2(file, 1)  
##D 
## End(Not run)



