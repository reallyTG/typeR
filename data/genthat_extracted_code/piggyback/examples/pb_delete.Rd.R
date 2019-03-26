library(piggyback)


### Name: pb_delete
### Title: Delete an asset attached to a release
### Aliases: pb_delete

### ** Examples

## No test: 
readr::write_tsv(mtcars, "mtcars.tsv.gz")
## Upload
pb_upload("mtcars.tsv.gz",
          repo = "cboettig/piggyback-tests",
           overwrite = TRUE)
pb_delete("mtcars.tsv.gz",
          repo = "cboettig/piggyback-tests",
          tag = "v0.0.1")
## End(No test)




