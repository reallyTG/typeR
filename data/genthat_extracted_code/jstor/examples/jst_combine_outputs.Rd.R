library(jstor)


### Name: jst_combine_outputs
### Title: Combine outputs from converted files
### Aliases: jst_combine_outputs

### ** Examples

# set up a temporary directory
tmp <- tempdir()

# find multiple files
file_list <- rep(jst_example("article_with_references.xml"), 2)

# convert and write to file
jst_import(file_list, "article", out_path = tmp, .f = jst_get_article,
             n_batches = 2, show_progress = FALSE)
             
# combine outputs
jst_combine_outputs(tmp)
list.files(tmp, "csv")

## Not run: 
##D # Trying to combine the files again raises an error.
##D jst_combine_outputs(tmp)
## End(Not run)

# this doesn't
jst_combine_outputs(tmp, overwrite = TRUE)

# we can remove the original files too
jst_combine_outputs(tmp, overwrite = TRUE, clean_up = TRUE)
list.files(tmp, "csv")




