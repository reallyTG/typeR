library(polmineR)


### Name: read
### Title: Display full text.
### Aliases: read read,partition-method read,partition_bundle-method
###   read,data.table-method read,hits-method read,kwic-method
###   read,regions-method

### ** Examples

use("polmineR")
merkel <- partition("GERMAPARLMINI", date = "2009-11-10", speaker = "Merkel", regex = TRUE)
read(merkel, meta = c("speaker", "date"))
read(
  merkel,
  highlight = list(yellow = c("Deutschland", "Bundesrepublik"), lightgreen = "Regierung"),
  meta = c("speaker", "date")
)

## Not run: 
##D pb <- as.speeches("GERMAPARLMINI", s_attribute_date = "date", s_attribute_name = "speaker")
##D pb <- pb[[ data.table::as.data.table(summary(pb))[size >= 500][["name"]] ]]
##D pb <- pb[[ 1:10 ]]
##D read(pb)
## End(Not run)



