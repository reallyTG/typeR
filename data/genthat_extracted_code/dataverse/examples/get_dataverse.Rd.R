library(dataverse)


### Name: get_dataverse
### Title: Get Dataverse
### Aliases: get_dataverse dataverse_contents

### ** Examples

## Not run: 
##D # view the root dataverse for a server
##D get_dataverse(":root")
##D dataverse_contents(":root")
##D 
##D # download file from: 
##D # https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/ARKOTI
##D monogan <- get_dataverse("monogan")
##D (monogan_data <- dataverse_contents(monogan))
##D 
##D # get a dataset from the dataverse
##D d1 <- get_dataset(monogan_data[[1]])
##D f <- get_file(d1$files$datafile$id[3])
## End(Not run)



