library(registry)


### Name: registry
### Title: Registry creator
### Aliases: registry
### Keywords: data

### ** Examples

R <- registry()

R$set_field("X", type = TRUE)
R$set_field("Y", type = "character")
R$set_field("index", type = "character", is_key = TRUE,
            index_FUN = match_partial_ignorecase)
R$set_field("index2", type = "integer", is_key = TRUE)

R$set_entry(X = TRUE, Y = "bla", index = "test", index2 = 1L)
R$set_entry(X = FALSE, Y = "foo", index = c("test", "bar"), index2 = 2L)

R$get_entries("test")
R[["test", 1]]
R["test"]
R[["test"]]



