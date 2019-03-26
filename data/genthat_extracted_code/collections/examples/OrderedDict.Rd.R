library(collections)


### Name: OrderedDict
### Title: Ordered Dictionary
### Aliases: OrderedDict
### Keywords: datasets

### ** Examples

d <- OrderedDict$new()
d$set("apple", 5)
d$set("orange", 10)
d$set("banana", 3)
d$get("apple")
d$as_list()  # the order the item is preserved
d$pop("orange")
d$as_list()  # "orange" is removed



