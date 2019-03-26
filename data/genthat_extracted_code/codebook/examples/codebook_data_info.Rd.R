library(codebook)


### Name: codebook_data_info
### Title: Codebook data info
### Aliases: codebook_data_info

### ** Examples

# will generate figures in a figure/ subdirectory
data("bfi")
metadata(bfi)$name <- "MOCK Big Five Inventory dataset (German metadata demo)"
metadata(bfi)$description <- "a small mock Big Five Inventory dataset"
metadata(bfi)$citation <- "doi:10.5281/zenodo.1326520"
metadata(bfi)$url <-
   "https://rubenarslan.github.io/codebook/articles/codebook.html"
codebook_data_info(bfi)



