library(polmineR)


### Name: corpus-class
### Title: S4 class to wrap information on CWB corpora.
### Aliases: corpus-class zoom $,corpus-method ==,corpus,ANY-method
###   !=,corpus,ANY-method %in%,corpus-method zoom,corpus-method

### ** Examples

corp <- corpus("GERMAPARLMINI")
corp2 <- corp$speaker
corp2@key
x <- corpus("GERMAPARLMINI")
x$date == "2009-10-28"
x <- corpus("GERMAPARLMINI")
x$party != "NA"
x <- corpus("GERMAPARLMINI")
x$date %in% c("2009-10-27", "2009-10-28")
x <- corpus("GERMAPARLMINI")
y <- zoom(x, date == "2009-10-28")

x <- partition("GERMAPARLMINI", interjection = "speech")
m <- zoom(x, date == "2009-10-28" & speaker == "Angela Dorothea Merkel")

not_unknown <- zoom(x, party != c("NA", "FDP"))
s_attributes(not_unknown, "party")



