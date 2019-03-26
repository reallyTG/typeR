library(kutils)


### Name: keyImport
### Title: Import/validate a key object or import/validate a key from a
###   file.
### Aliases: keyImport

### ** Examples

mydf.key.path <- system.file("extdata", "mydf.key.csv", package = "kutils")
mydf.key <-  keyImport(mydf.key.path)
## Create some dupes
mydf.key <- rbind(mydf.key, mydf.key[c(1,7), ])
mydf.key2 <- keyImport(mydf.key)
mydf.key2
## create some empty value_new cells
mydf.key[c(3, 5, 7) , "value_new"] <- ""
mydf.key3 <- keyImport(mydf.key)
mydf.key3
mydf.keylong.path <- system.file("extdata", "mydf.key_long.csv", package = "kutils")
mydf.keylong <- keyImport(mydf.keylong.path)

## testDF is a slightly more elaborate version created for unit testing:
testdf.path <- system.file("extdata", "testDF.csv", package = "kutils")
testdf <- read.csv(testdf.path, header = TRUE)
keytemp <- keyTemplate(testdf, long = TRUE)
## A "hand edited key file"
keyPath <- system.file("extdata", "testDF-key.csv", package="kutils")
key <- keyImport(keyPath)
keydiff <- keyDiff(keytemp, key)
key2 <- rbind(key, keydiff$neworaltered)
key2 <- unique(key)
if(interactive())View(key2)




