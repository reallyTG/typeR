library(csvread)


### Name: csvread
### Title: Fast Specialized CSV File Loader.
### Aliases: csvread csvread-package map.coltypes
### Keywords: 64-bit bigint comma-separated csv delimited file import
###   integer64 read.csv text

### ** Examples

## Not run: 
##D ## Basic use case when column types are known and there's no missing data.
##D 
##D frm <- csvread("inst/10rows.csv",
##D 	coltypes = c("longhex", "string", "double", "integer", "long"),
##D 	header = FALSE)
##D 
##D frm
##D # COL1       COL2     COL3 COL4 COL5
##D # 1  11fb89c1558c792 2011-05-06 0.150001 4970 4977
##D # 2  11fb89c1558c792 2011-05-06 0.150001 4970 4987
##D # 3  11fb89c1558c792 2011-05-06 0.150001 5200 5528
##D # 4  11fb89c1558c792 2011-05-06 0.150001 4970 5004
##D # 5  11fb89c1558c792 2011-05-06 0.150001 4970 4980
##D # 6  11fb89c1558c792 2011-05-06 0.150001 4970 5020
##D # 7  11fb89c1558c792 2011-05-06 0.150001 4970 5048
##D # 8  11fb89c1558c792 2011-05-06 0.150001 4970 5035
##D # 9  11fb89c1558c792 2011-05-06 0.150001 4970 4971
##D # 10 11fb89c1558c792 2011-05-06 0.150001 4970 4973
##D 
##D typeof(frm$COL1)
##D # [1] "double"
##D class(frm$COL1)
##D # [1] "int64"
##D 
##D typeof(frm$COL5)
##D # [1] "double"
##D class(frm$COL5)
##D # [1] "int64"
##D 
##D #### Examples with missing data.
##D 
##D ## The input file contains values "NA", "NA ", " NA ", "NULL", "na"
##D ## and missing fields in various columns.
##D 
##D writeLines(scan("inst/10rows_na.csv", "character", sep = "\n"))
##D # Read 10 items
##D # 11fb89c1558c792,2011-05-06,0.150001,4970,4977
##D # 11fb89c1558c792,2011-05-06,0.150001,4970,4987
##D # 11fb89c1558c792, NA ,0.150001,NA ,5528
##D # NA,2011-05-06,0.150001,4970,5004
##D # 11fb89c1558c792,na,0.150001,4970,4980
##D # 11fb89c1558c792,2011-05-06,NA,4970,5020
##D # 11fb89c1558c792,2011-05-06,0.150001,NULL,5048
##D # 11fb89c1558c792,2011-05-06,0.150001,4970,NA
##D # ,2011-05-06,0.150001,4970,4971
##D # 11fb89c1558c792,2011-05-06,0.150001,4970,
##D 
##D ## By default, all missing fields in this input are handled, except
##D ## for the " NA " in a character column COL3, which remains unchanged.
##D ## This is the intended behavior, similar to that of read.csv.
##D 
##D frm <- csvread("inst/10rows_na.csv",
##D 	coltypes = c("longhex", "string", "double", "integer", "long"),
##D 	header = FALSE)
##D 
##D frm
##D # COL1       COL2     COL3 COL4 COL5
##D # 1  11fb89c1558c792 2011-05-06 0.150001 4970 4977
##D # 2  11fb89c1558c792 2011-05-06 0.150001 4970 4987
##D # 3  11fb89c1558c792        NA  0.150001   NA 5528
##D # 4             <NA> 2011-05-06 0.150001 4970 5004
##D # 5  11fb89c1558c792       <NA> 0.150001 4970 4980
##D # 6  11fb89c1558c792 2011-05-06       NA 4970 5020
##D # 7  11fb89c1558c792 2011-05-06 0.150001   NA 5048
##D # 8  11fb89c1558c792 2011-05-06 0.150001 4970 <NA>
##D # 9             <NA> 2011-05-06 0.150001 4970 4971
##D # 10 11fb89c1558c792 2011-05-06 0.150001 4970 <NA>
## End(Not run)
## Not run: 
##D #### The column types can be guessed by using map.coltypes.
##D 
##D coltypes <- map.coltypes("inst/10rows.csv", header = FALSE)
##D coltypes
##D #       V1        V2        V3        V4        V5
##D # "string"  "string"  "double" "integer" "integer"
##D 
##D ## Note the difference when "NA"s are present in an integer column 4,
##D ## which is then considered to be a string column.
##D coltypes.na <- map.coltypes("inst/10rows_na.csv", header = FALSE)
##D coltypes.na
##D #        V1        V2        V3        V4        V5
##D #  "string"  "string"  "double"  "string" "integer"
##D 
##D frm <- csvread(file = "inst/10rows.csv", coltypes = coltypes,
##D    header = F, verbose = T)
##D # Counted 10 lines.
##D 
##D frm
##D #               COL1       COL2     COL3 COL4 COL5
##D # 1  11fb89c1558c792 2011-05-06 0.150001 4970 4977
##D # 2  11fb89c1558c792 2011-05-06 0.150001 4970 4987
##D # 3  11fb89c1558c792 2011-05-06 0.150001 5200 5528
##D # 4  11fb89c1558c792 2011-05-06 0.150001 4970 5004
##D # 5  11fb89c1558c792 2011-05-06 0.150001 4970 4980
##D # 6  11fb89c1558c792 2011-05-06 0.150001 4970 5020
##D # 7  11fb89c1558c792 2011-05-06 0.150001 4970 5048
##D # 8  11fb89c1558c792 2011-05-06 0.150001 4970 5035
##D # 9  11fb89c1558c792 2011-05-06 0.150001 4970 4971
##D # 10 11fb89c1558c792 2011-05-06 0.150001 4970 4973
##D typeof(frm$COL1)
##D # [1] "character"
##D class(frm$COL1)
##D # [1] "character"
##D 
##D typeof(frm$COL5)
##D # [1] "integer"
##D class(frm$COL5)
##D # [1] "integer"
##D 
##D ## Convert the first column to int64 manually
##D 
##D frm$COL1 <- as.int64(frm$COL1, base = 16)
##D frm$COL1
##D # [1] "11fb89c1558c792" "11fb89c1558c792" "11fb89c1558c792" "11fb89c1558c792"
##D # [5] "11fb89c1558c792" "11fb89c1558c792" "11fb89c1558c792" "11fb89c1558c792"
##D # [9] "11fb89c1558c792" "11fb89c1558c792"
##D typeof(frm$COL1)
##D # [1] "double"
##D class(frm$COL1)
##D # [1] "int64"
##D 
##D ## Print the first value in base 10.
##D as.character.int64(frm$COL1[1], base = 10)
##D # [1] "80986298828507026"
##D 
##D #### Character (string) columns with NAs and non-default na.strings
##D 
##D ## A file with NAs and missing values: note that the in the first
##D ## column, an empty string in row 9 is not considered NA because
##D ## na.strings are set to "NA". By default, the empty string will be
##D ## considered NA. Also, in column 2, rows 3 and 5, the values are
##D ## " NA " (with spaces) and "na", respectively, because they don't
##D ## match values in na.strings and therefore are not considered to be NA.
##D 
##D coltypes
##D #       V1        V2        V3        V4        V5
##D # "string"  "string"  "double" "integer" "integer"
##D 
##D frm <- csvread(file = "inst/10rows_na.csv", coltypes = coltypes,
##D    header = F, verbose = T, na.strings = "NA")
##D # Counted 10 lines.
##D 
##D frm
##D #               COL1       COL2     COL3 COL4 COL5
##D # 1  11fb89c1558c792 2011-05-06 0.150001 4970 4977
##D # 2  11fb89c1558c792 2011-05-06 0.150001 4970 4987
##D # 3  11fb89c1558c792        NA  0.150001   NA 5528
##D # 4             <NA> 2011-05-06 0.150001 4970 5004
##D # 5  11fb89c1558c792         na 0.150001 4970 4980
##D # 6  11fb89c1558c792 2011-05-06       NA 4970 5020
##D # 7  11fb89c1558c792 2011-05-06 0.150001   NA 5048
##D # 8  11fb89c1558c792 2011-05-06 0.150001 4970   NA
##D # 9                  2011-05-06 0.150001 4970 4971
##D # 10 11fb89c1558c792 2011-05-06 0.150001 4970   NA
##D 
## End(Not run)



