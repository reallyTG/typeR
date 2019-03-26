library(polmineR)


### Name: decode
### Title: Decode structural attribute, partition or corpus.
### Aliases: decode

### ** Examples

## Not run: 
##D use("polmineR")
##D 
##D # Scenario 1: Decode one or two s-attributes
##D dt <- decode("REUTERS", s_attribute = "id")
##D dt <- decode("REUTERS", s_attribute = c("topics_cat", "places"))
##D 
##D # Scenario 2: Decode entire corpus
##D dt <- decode("REUTERS")
##D 
##D # Scenario 3: Decode partition
##D p <- partition("REUTERS", places = "kuwait", regex = TRUE)
##D dt <- decode(p)
##D 
##D # Scenario 4: Decode partition_bundle
##D pb <- partition_bundle("REUTERS", s_attribute = "id")
##D dts <- lapply(as.list(pb), decode)
##D dts <- lapply(names(dts), function(n) dts[[n]][, speech_id := n])
##D dt <- data.table::rbindlist(dts)
## End(Not run)



