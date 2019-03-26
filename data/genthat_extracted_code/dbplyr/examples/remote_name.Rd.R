library(dbplyr)


### Name: remote_name
### Title: Metadata about a remote table
### Aliases: remote_name remote_src remote_con remote_query
###   remote_query_plan

### ** Examples

mf <- memdb_frame(x = 1:5, y = 5:1, .name = "blorp")
remote_name(mf)
remote_src(mf)
remote_con(mf)
remote_query(mf)

mf2 <- dplyr::filter(mf, x > 3)
remote_name(mf2)
remote_src(mf2)
remote_con(mf2)
remote_query(mf2)



