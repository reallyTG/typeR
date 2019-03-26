library(dataverse)


### Name: get_file
### Title: Download File(s)
### Aliases: get_file get_file_metadata

### ** Examples

## Not run: 
##D # download file from: 
##D # https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/ARKOTI
##D monogan <- get_dataverse("monogan")
##D monogan_data <- dataverse_contents(monogan)
##D d1 <- get_dataset("doi:10.7910/DVN/ARKOTI")
##D f <- get_file(d1$files$datafile$id[3])
##D 
##D # check file metadata
##D m1 <- get_file_metadata("constructionData.tab", "doi:10.7910/DVN/ARKOTI")
##D m2 <- get_file_metadata(2437257)
##D 
##D # retrieve file based on DOI and filename
##D f2 <- get_file("constructionData.tab", "doi:10.7910/DVN/ARKOTI")
##D f2 <- get_file(2692202)
##D 
##D # retrieve file based on "dataverse_file" object
##D flist <- dataset_files(2692151)
##D get_file(flist[[2]])
##D 
##D # read file as data.frame
##D if (require("rio")) {
##D   tmp <- tempfile(fileext = ".dta")
##D   writeBin(f, tmp)
##D   str(dat <- rio::import(tmp, haven = FALSE))
##D 
##D   # check UNF match
##D   #if (require("UNF")) {
##D   #  unf(dat) %unf% d1$files$datafile$UNF[3]
##D   #}
##D }
## End(Not run)



