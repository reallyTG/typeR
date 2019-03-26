library(chinese.misc)


### Name: csv2txt
### Title: Write Texts in CSV into Many TXT/RTF Files
### Aliases: csv2txt

### ** Examples

## Not run: 
##D # First, we create a csv file
##D x1 <- file.path(find.package("base"), "CITATION")
##D x2 <- file.path(find.package("base"), "DESCRIPTION")
##D txt2csv(x1, x2, must_txt = FALSE, csv = "x1x2csv.csv")
##D # Now try to write files
##D wd <- getwd()
##D wd <- gsub("/$|\\\\$", "", wd)
##D f <- paste(wd, "x1x2csv", sep="/")
##D csv2txt(csv = "x1x2csv.csv", folder = f, which = 3, ext = "")
## End(Not run)



