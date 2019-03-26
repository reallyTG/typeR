library(datapack)


### Name: canRead
### Title: Test whether the provided subject can read an object.
### Aliases: canRead canRead,DataObject-method

### ** Examples

data <- charToRaw("1,2,3\n4,5,6\n")
obj <- new("DataObject", id="1234", dataobj=data, format="text/csv")
obj <- addAccessRule(obj, "smith", "read")
access <- canRead(obj, "smith")



