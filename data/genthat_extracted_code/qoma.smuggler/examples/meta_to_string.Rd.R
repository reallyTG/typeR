library(qoma.smuggler)


### Name: meta_to_string
### Title: Get a meta data string for an object
### Aliases: meta_to_string

### ** Examples

dbname <- file.path(Sys.getenv("FAME"),"util","driecon")
famedb <- read_fame(dbname)
meta <- famedb$get_meta('GDP')
cat(meta_to_string(famedb$get('GDP')$meta, objnam))



