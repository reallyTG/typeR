library(W3CMarkupValidator)


### Name: w3c_markup_validate_db
### Title: Collections of W3C Markup Validation Results
### Aliases: w3c_markup_validate_db w3c_markup_validate_files
###   w3c_markup_validate_uris

### ** Examples

## Test files provided with this package:
dir <- system.file("examples", package = "W3CMarkupValidator")
files <- Sys.glob(file.path(dir, "*.html"))
if(!grepl("^http://validator.w3.org",
          w3c_markup_validate_baseurl())) {
    ## Validate.
    results <- w3c_markup_validate_files(files)
    results
    ## In case of failures, inspect the error messages:
    lapply(attr(results, "failures"), conditionMessage)
    ## Inspect validation results:
    inspect(results)
    inspect(results, full = TRUE)
    ## Turn results into a data frame:
    df <- as.data.frame(results)
    ## Tabulate error messages:
    table(substring(df$message, 1L, 60L))
    ## Inspect a particular set of error messages:
    df[df$message == "element \"font\" undefined", ]
    ## (Note that explanations are in HTML ...)
    ## Conveniently view the full records (modulo HTML markup):
    write.dcf(df)
}



