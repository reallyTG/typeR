library(Rdpack)


### Name: Rdo_get_insert_pos
### Title: Find the position of an "Rd_tag"
### Aliases: Rdo_get_insert_pos
### Keywords: RdoProgramming

### ** Examples

h <- help("Rdo_macro")
rdo <- utils:::.getHelpFile(h)

ialias <- which(tools:::RdTags(rdo) == "\\alias")
next_pos <- Rdo_get_insert_pos(rdo, "\\alias") # 1 + max(ialias)
stopifnot(next_pos == max(ialias) + 1)

ikeyword <- which(tools:::RdTags(rdo) == "\\keyword")
next_pos <- Rdo_get_insert_pos(rdo, "\\keyword") # 1 + max(ikeyword)
stopifnot(next_pos == max(ikeyword) + 1)




