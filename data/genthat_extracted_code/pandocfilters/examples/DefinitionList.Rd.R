library(pandocfilters)


### Name: DefinitionList
### Title: Definition List
### Aliases: DefinitionList

### ** Examples

key <- list(Str("key"))
value <- list(list(Plain(list(Str("value")))))
DefinitionList(list(list(key, value), Definition("some key", Plain("some value"))))



