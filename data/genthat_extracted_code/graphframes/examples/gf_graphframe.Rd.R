library(graphframes)


### Name: gf_graphframe
### Title: Create a new GraphFrame
### Aliases: gf_graphframe

### ** Examples

## Not run: 
##D library(sparklyr)
##D sc <- spark_connect(master = "local", version = "2.3.0")
##D v_tbl <- sdf_copy_to(
##D   sc, data.frame(id = 1:3, name = LETTERS[1:3])
##D )
##D e_tbl <- sdf_copy_to(
##D   sc, data.frame(src = c(1, 2, 2), dst = c(2, 1, 3),
##D                  action = c("love", "hate", "follow"))
##D )
##D gf_graphframe(v_tbl, e_tbl)
##D gf_graphframe(edges = e_tbl)
## End(Not run)



