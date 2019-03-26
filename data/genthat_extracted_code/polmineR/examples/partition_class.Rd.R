library(polmineR)


### Name: partition_class
### Title: Partition class and methods.
### Aliases: partition_class partition-class show,partition-method
###   [,partition,ANY,ANY,ANY-method [,partition-method as.partition_bundle
###   as.partition_bundle,partition-method export export,partition-method
###   split summary,partition-method plpr_partition-class
###   press_partition-class p_attributes,partition-method
###   split,partition-method is.partition $,partition-method
###   ==,partition,ANY-method !=,partition,ANY-method %in%,partition-method
###   zoom,partition-method enrich,partition-method
###   as.regions,partition-method

### ** Examples

m <- partition("GERMAPARLMINI", speaker = "Merkel", regex = TRUE)
m2 <- m$speaker
m2@key
m <- partition("GERMAPARLMINI", speaker = "Merkel", regex = TRUE)
m$date == "2009-10-28"
s <- partition("GERMAPARLMINI", interjection = "speech")
s$party != "NA"
s <- partition("GERMAPARLMINI", interjection = "speech")
s$date %in% c("2009-10-27", "2009-10-28")
m <- partition("GERMAPARLMINI", speaker = "Merkel", regex = TRUE)
y <- zoom(m, date == "2009-10-28")

speeches <- partition("GERMAPARLMINI", interjection = "speech")
m <- zoom(speeches, date == "2009-10-28" & speaker == "Angela Dorothea Merkel")

not_unknown <- zoom(speeches, party != c("NA", "FDP"))
s_attributes(not_unknown, "party")



