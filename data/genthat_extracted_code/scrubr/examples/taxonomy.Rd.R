library(scrubr)


### Name: taxonomy
### Title: Taxonomy based cleaning
### Aliases: tax_no_epithet taxonomy

### ** Examples

if (requireNamespace("rgbif", quietly = TRUE)) {
   library("rgbif")
   res <- rgbif::occ_data(limit = 200)$data
} else {
   res <- sample_data_3
}

# Remove records where names don't have genus + epithet
## so removes those with only genus and those with no name (NA or NULL)
NROW(res)
df <- dframe(res) %>% tax_no_epithet(name = "name")
NROW(df)
attr(df, "name_var")
attr(df, "tax_no_epithet")



