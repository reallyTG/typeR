library(codebook)


### Name: codebook_component_scale
### Title: Codebook component for scales
### Aliases: codebook_component_scale

### ** Examples

# will generate figures in a temporary directory
old_base_dir <- knitr::opts_knit$get("base.dir")
knitr::opts_knit$set(base.dir = tempdir())
on.exit(knitr::opts_knit$set(base.dir = old_base_dir))
data("bfi")
bfi <- bfi[,c("BFIK_open", paste0("BFIK_open_", 1:4))]
codebook_component_scale(bfi[,1], "BFIK_open", bfi[,-1],
   reliabilities = list(BFIK_open = psych::alpha(bfi[,-1])))



