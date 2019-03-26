library(gWidgets2)


### Name: addStockIcons
### Title: Method to add icon to list of stock icons
### Aliases: .addStockIcons .addStockIcons.default .getStockIconByName
###   .getStockIconByName.default .getStockIcons .getStockIcons.default
###   .stockIconFromClass .stockIconFromClass.default .stockIconFromObject
###   .stockIconFromObject.default addStockIcons getStockIconByName
###   getStockIcons stockIconFromClass stockIconFromObject

### ** Examples

## Not run: 
##D ## we can add icon sets, say those of glyphicons.com. Steps are download files, unzip
##D ## then point x to path, y to name. Imagine we download and current directory is
##D ## png directory. (Won't work with tcltk by default as these are png files)
##D x <- Sys.glob("*.png")
##D path <- paste(getwd(), x, sep=.Platform$file.sep)
##D nm <- gsub("\\.png", "", x)
##D nm <- gsub("-", "_", nm)
##D nm <- gsub("\\+", "_plus", nm)
##D addStockIcons(nm, path)
## End(Not run)



