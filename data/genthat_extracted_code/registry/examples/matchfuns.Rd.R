library(registry)


### Name: matchfuns
### Title: Matching functions
### Aliases: matchfuns match_ignorecase match_exact match_partial
###   match_partial_ignorecase match_regexp
### Keywords: data

### ** Examples

## use exact matching
R <- registry(stop_if_missing = FALSE)
R$set_field("Key", type = "character", is_key = TRUE, index_FUN = match_exact)
R$set_field("Value", type = "numeric")
R$set_entry("the key", 1)

R[["the key"]]
R[["the"]]

## use partial matching
R <- registry()
R$set_field("Key", type = "character", is_key = TRUE, index_FUN = match_partial)
R$set_field("Value", type = "numeric")
R$set_entry("the key", 1)

R[["the"]]

## use regular expressions
R <- registry()
R$set_field("Key", type = "character", is_key = TRUE, index_FUN = match_regexp)
R$set_field("Value", type = "numeric")
R$set_entry("the key", 1)
R$set_entry("key", 2)

R[["k.*"]]
R["k.*"]




