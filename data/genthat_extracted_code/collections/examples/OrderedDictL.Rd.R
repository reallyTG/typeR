library(collections)


### Name: OrderedDictL
### Title: Ordered Dictionary (list based)
### Aliases: OrderedDictL
### Keywords: datasets

### ** Examples

d <- OrderedDictL$new()
d$set("apple", 5)
d$set("orange", 10)
d$set("banana", 3)
d$get("apple")
d$as_list()  # the order the item is preserved
d$pop("orange")
d$as_list()  # "orange" is removed



