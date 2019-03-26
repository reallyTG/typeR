library(kutils)


### Name: long2wide
### Title: convert a key object from long to wide format
### Aliases: long2wide

### ** Examples

mydf.path <- system.file("extdata", "mydf.csv", package = "kutils")
mydf <- read.csv(mydf.path, stringsAsFactors=FALSE)
## A wide key we are trying to match:
mydf.key <- keyTemplate(mydf, long = FALSE, sort = TRUE)
mydf.key["x4", "missings"] <- "999"
## A long key we will convert next
mydf.keylong <- keyTemplate(mydf, long = TRUE, sort = TRUE)
mydf.keylong[mydf.keylong[ , "name_old"] == "x4" &
    mydf.keylong[ , "value_old"] == "999", "missings"] <- "999"
mydf.long2wide <- long2wide(mydf.keylong)
all.equal(mydf.key, mydf.long2wide)

mydf.keylong.path <- system.file("extdata", "mydf.key_long.csv", package = "kutils")
mydf.keylong <- keyImport(mydf.keylong.path)
mydf.keywide <- long2wide(mydf.keylong)
mydf.keylong2 <- wide2long(mydf.keywide)
## Is error if following not TRUE
all.equal(mydf.keylong2, mydf.keylong)




