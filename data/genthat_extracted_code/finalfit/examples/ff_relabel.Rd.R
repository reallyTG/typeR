library(finalfit)


### Name: ff_relabel
### Title: Relabel variables in a data frame
### Aliases: ff_relabel finalfit_relabel

### ** Examples

# Label variable
colon_s$sex.factor %>%
  ff_label("Sex") %>%
  str()

# Make factor level "Unknown" NA
colon_s %>%
  dplyr::mutate_if(is.factor, forcats::fct_recode, 
  NULL = "Unknown") %>% 
  str()

# Reset data
data(colon_s)

# Extract variable labels
vlabels = colon_s %>% extract_variable_label()

# Run function where labels are lost
colon_s %>%
  dplyr::mutate_if(is.factor, forcats::fct_recode, 
  NULL = "Unknown") %>% 
  str()

# Relabel
colon_s %<>% ff_relabel(vlabels)
colon_s %>% str()
  



