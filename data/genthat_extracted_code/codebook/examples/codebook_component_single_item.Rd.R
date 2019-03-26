library(codebook)


### Name: codebook_component_single_item
### Title: Codebook component for single items
### Aliases: codebook_component_single_item

### ** Examples

# will generate figure in a temporary directory
old_base_dir <- knitr::opts_knit$get("base.dir")
knitr::opts_knit$set(base.dir = tempdir())
on.exit(knitr::opts_knit$set(base.dir = old_base_dir))
data("bfi")
codebook_component_single_item(bfi$BFIK_open_1, "BFIK_open_1")



