library(kutils)


### Name: wide2long
### Title: Convert a key object from wide to long format
### Aliases: wide2long

### ** Examples

mydf.path <- system.file("extdata", "mydf.csv", package = "kutils")
mydf <- read.csv(mydf.path, stringsAsFactors=FALSE)
## Target we are trying to match:
mydf.keylong <- keyTemplate(mydf, long = TRUE, sort = FALSE)

mydf.key <- keyTemplate(mydf)
mydf.keywide2long <- wide2long(mydf.key)

## rownames not meaningful in long key, so remove in both versions
row.names(mydf.keywide2long) <- NULL
row.names(mydf.keylong) <- NULL
all.equal(mydf.keylong, mydf.keywide2long)



