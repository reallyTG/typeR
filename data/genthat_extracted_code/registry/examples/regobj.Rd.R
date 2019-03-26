library(registry)


### Name: regobj
### Title: Registry object
### Aliases: regobj summary.registry print.registry [.registry [[.registry
### Keywords: data

### ** Examples

regobj <- registry()
regobj$set_field("X", type = TRUE)
regobj$set_field("Y", type = "character")
regobj$set_field("index", type = "character", is_key = TRUE,
            index_FUN = match_partial_ignorecase)
regobj$set_field("index2", type = "integer", is_key = TRUE)
regobj$set_entry(X = TRUE, Y = "bla", index = "test", index2 = 1L)
regobj$set_entry(X = FALSE, Y = "foo", index = c("test", "bar"), index2 = 2L)
regobj$get_entries("test")
regobj[["test", 1]]
regobj["test"]
regobj[["test"]]



