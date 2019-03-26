library(paws.common)


### Name: tags
### Title: Get, set, and delete object tags
### Aliases: tags tag_get tag_has tag_add tag_del type

### ** Examples

foo <- list()
foo <- tag_add(foo, list(tag_name = "tag_value"))
tag_has(foo, "tag_name") # TRUE
tag_get(foo, "tag_name") # "tag_value"
tag_get(foo, "not_exist") # ""
foo <- tag_del(foo)
tag_has(foo, "tag_name") # FALSE




