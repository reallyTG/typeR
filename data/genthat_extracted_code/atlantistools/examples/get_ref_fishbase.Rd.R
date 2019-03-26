library(atlantistools)


### Name: get_ref_fishbase
### Title: Extract the bibliographic info from www.fishbase.org.
### Aliases: get_ref_fishbase

### ** Examples

## Not run: 
##D df <- get_growth_fishbase("Scyliorhinus canicula")
##D 
##D df$data_ref[df$data_ref == df$main_ref] <- NA
##D df <- tidyr::gather_(data = df,
##D                      key_col = "ref_type",
##D                      value_col = "ref_id",
##D                      gather_cols = c("main_ref", "data_ref"), na.rm = TRUE)
##D ref_id <- unique(df$ref_id)
##D get_ref_fishbase(ref_id)
## End(Not run)



