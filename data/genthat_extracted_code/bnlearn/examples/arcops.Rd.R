library(bnlearn)


### Name: arc operations
### Title: Drop, add or set the direction of an arc or an edge
### Aliases: 'arc operations' set.arc drop.arc reverse.arc set.edge
###   drop.edge
### Keywords: graphs

### ** Examples

data(learning.test)
res = gs(learning.test)

## use debug = TRUE to get more information.
set.arc(res, "A", "B")
drop.arc(res, "A", "B")
drop.edge(res, "A", "B")
reverse.arc(res, "A", "D")



