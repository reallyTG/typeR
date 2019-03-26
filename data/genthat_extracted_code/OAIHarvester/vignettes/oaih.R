### R code from vignette source 'oaih.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: oaih.Rnw:196-198
###################################################
library("OAIHarvester")
baseurl <- "http://epub.wu.ac.at/cgi/oai2"


###################################################
### code chunk number 2: oaih.Rnw:202-205
###################################################
require("xml2")
options(warnPartialMatchArgs = FALSE)
options(width = 80)


###################################################
### code chunk number 3: oaih.Rnw:210-212
###################################################
x <- oaih_identify(baseurl)
rbind(x, deparse.level = 0)


###################################################
### code chunk number 4: oaih.Rnw:218-219
###################################################
sapply(x$description, xml_name)


###################################################
### code chunk number 5: oaih.Rnw:223-224
###################################################
oaih_transform(x$description[[1L]])


###################################################
### code chunk number 6: oaih.Rnw:229-232
###################################################
oaih_list_metadata_formats(baseurl)
sets <- oaih_list_sets(baseurl)
rbind(head(sets, 3L), tail(sets, 3L))


###################################################
### code chunk number 7: oaih.Rnw:238-239
###################################################
spec <- unlist(sets[sets[, "setName"] == "Type = Thesis", "setSpec"])


###################################################
### code chunk number 8: oaih.Rnw:242-243
###################################################
x <- oaih_list_records(baseurl, set = spec)


###################################################
### code chunk number 9: oaih.Rnw:247-249
###################################################
dim(x)
colnames(x)


###################################################
### code chunk number 10: oaih.Rnw:254-257
###################################################
m <- x[, "metadata"]
m <- oaih_transform(m[lengths(m) > 0L])
dim(m)


###################################################
### code chunk number 11: oaih.Rnw:260-261
###################################################
colnames(m)


###################################################
### code chunk number 12: oaih.Rnw:313-314
###################################################
m[c(1L, 6L, 7L), "subject"]


###################################################
### code chunk number 13: oaih.Rnw:318-323
###################################################
sep <- "[[:space:]]*/[[:space:]]*"
keywords_by_thesis <-
    strsplit(unlist(lapply(m[, "subject"],  paste, collapse = " / ")),
             sep)
keywords <- unlist(keywords_by_thesis)


###################################################
### code chunk number 14: oaih.Rnw:327-329
###################################################
counts <- table(keywords)
table(counts)


###################################################
### code chunk number 15: oaih.Rnw:333-334
###################################################
sort(counts[counts >= 3L], decreasing = TRUE)


###################################################
### code chunk number 16: oaih.Rnw:338-339
###################################################
counts["R"]


###################################################
### code chunk number 17: oaih.Rnw:342-345
###################################################
lapply(m[sapply(keywords_by_thesis, function(kw) any(kw == "R")),
         c("title", "creator")],
       strwrap)


###################################################
### code chunk number 18: oaih.Rnw:350-352
###################################################
m[grep("^Feinerer", unlist(m[, "creator"])),
  c("title", "creator", "subject")]


