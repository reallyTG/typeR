library(Gmisc)


### Name: retrieve
### Title: An R alternative to the lodash 'get' in JavaScript
### Aliases: retrieve

### ** Examples

source <- list(a = list(b = 1, `odd.name` = 'I hate . in names', c(1,2,3)))
retrieve(source, "a.b")
retrieve(source, "a.b.1")
retrieve(source, "a.odd\\.name")
retrieve(source, "a.not_in_list")




