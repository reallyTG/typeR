library(collections)


### Name: Dict
### Title: Dictionary
### Aliases: Dict
### Keywords: datasets

### ** Examples

d <- Dict$new()
d$set("apple", 5)
d$set("orange", 10)
d$set("banana", 3)
d$get("apple")
d$as_list()  # unordered
d$pop("orange")
d$as_list()  # "orange" is removed



