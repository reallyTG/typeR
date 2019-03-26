library(codebook)


### Name: likert_from_items
### Title: Derive a likert object from items
### Aliases: likert_from_items

### ** Examples

data("bfi", package = "codebook")
open_items <- paste0("BFIK_open_",1:4)
graphics::plot(likert_from_items(bfi[, open_items]))



