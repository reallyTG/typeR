library(qpcR)


### Name: pcrimport
### Title: Advanced qPCR data import function
### Aliases: pcrimport
### Keywords: IO file

### ** Examples


## Not run: 
##D ## EXAMPLE 1:
##D ## Internal dataset format01.txt (in 'add01' directory)
##D ## with 384 runs.
##D ## Tab delimited, 30 cycles, only reporter dye,
##D ## data in rows, and some unneeded columns and rows.
##D ## This is the example data path, but could be any path
##D ## with data such as c:/temp.
##D PATH <- path.package("qpcR")
##D PATHall <- paste(PATH, "/add01/", sep = "")
##D res <- pcrimport(PATHall)
##D 
##D ## Answer queries with the following parameters and
##D ## verify the effects in the 'View' windows:
##D ## 1 => data is tab delimited
##D ## 1 => decimal separator is "."
##D ## c(1, 3) => remove columns 1 + 3
##D ## 1:2 => remove rows 1 + 2
##D ## 2 => data is in rows
##D ## 0 => all data is from reporter dye
##D ## 1 => sample names are in row #1
##D ## 0 => reporter data goes until end of table
##D ## Data is stored as dataframe list items and can
##D ## then be analyzed:
##D ml <- modlist(res[[1]], model = l5)
##D plot(ml, which = "single")
##D 
##D ## Alternative without query:
##D res <- pcrimport(PATHall, sep = "\t", dec = ".",
##D                  delCol = c(1, 3), delRow = 1:2,
##D                  format = "row", sampleDat = 0,
##D                  names = 1, sampleLen = 0,
##D                  check = FALSE)
##D 
##D ## Do something useful with the data:
##D ml <- modlist(res[[1]], model = l5)
##D plot(ml, which = "single")
##D                  
##D ## EXAMPLE 2:
##D ## Internal datasets format02a.txt - format02d.txt
##D ## (in 'add02' directory) with 96 runs.
##D ## Tab delimited, 40 cycles, reporter dye + reference dye,
##D ## data in columns, and some unneeded columns and rows.
##D PATH <- path.package("qpcR")
##D PATHall <- paste(PATH, "/add02/", sep = "")
##D res <- pcrimport(PATHall)
##D 
##D ## Answer queries with the following parameters and
##D ## verify the effects in the 'View' windows:
##D ## 1 => data is tab delimited
##D ## 1 => decimal separator is "."
##D ## 1 => remove column 1 with cycle data
##D ## c(1, 43, 44) => remove rows 1, 43, 44
##D ## 1 => data is in columns
##D ## 1:96 => data columns for reporter dye
##D ## -2 => reference dye stacked under reporter dye
##D ## 1 => sample names are in row #1
##D ## 1:40 => reporter data is in rows 1-40
##D ## -1 => reference data is stacked under samples
##D ## Data is stored as dataframe list items and can
##D ## then be analyzed.
##D 
##D ## Alternative without query:
##D res2 <- pcrimport(PATHall, sep = "\t", dec = ".",
##D                  delCol = 1, delRow = c(1, 43, 44),
##D                  format = "col", sampleDat = 1:96,
##D                  refDat = -2, names = 1,
##D                  sampleLen = 1:40, refLen = -1,
##D                  check = FALSE)
##D 
##D ## Do something useful with the data:
##D ml2 <- modlist(res2[[1]], model = l5)
##D plot(ml2)
## End(Not run)



