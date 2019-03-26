library(codebook)


### Name: add_R
### Title: Append R to string, if it doesn't end in R already.
### Aliases: add_R

### ** Examples

data('bfi')
bfi %>% dplyr::select(BFIK_open_2,BFIK_agree_2) %>% dplyr::rename_at(1, add_R) %>% head()



