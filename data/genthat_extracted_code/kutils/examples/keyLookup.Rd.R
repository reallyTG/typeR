library(kutils)


### Name: keyLookup
### Title: Look for old (or new) names in variable key
### Aliases: keyLookup

### ** Examples

mydf.key.path <- system.file("extdata", "mydf.key.csv", package = "kutils")
mydf.key <-  keyImport(mydf.key.path)
mydf.key$name_new <- paste0("new_", mydf.key$name_new)
keyLookup("new_x5", mydf.key, get = "name_old")
keyLookup(c("new_x6", "new_x1"), mydf.key, get = "name_old")
keyLookup(c("x6", "x1"), mydf.key, get = "name_new")
keyLookup(c("asdf", "new_x1"), mydf.key, get = "name_old")

mydf.key <- rbind(mydf.key,
                 c("x3", "x3f",  "ordered", "factor", "","","",""))
keyLookup(c("x3"), mydf.key, get = "name_new")
keyLookup(c("x1", "x3", "x5"), mydf.key, get = "name_new")



