library(polmineR)


### Name: as.markdown
### Title: Get markdown-formatted full text of a partition.
### Aliases: as.markdown as.markdown,partition-method
###   as.markdown,plpr_partition-method

### ** Examples

use("polmineR")
P <- partition("REUTERS", places = "argentina")
as.markdown(P)
as.markdown(P, meta = c("id", "places"))
if (interactive()) read(P, meta = c("id", "places"))



