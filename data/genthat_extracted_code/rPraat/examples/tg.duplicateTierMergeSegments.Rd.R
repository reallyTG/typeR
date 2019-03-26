library(rPraat)


### Name: tg.duplicateTierMergeSegments
### Title: tg.duplicateTierMergeSegments
### Aliases: tg.duplicateTierMergeSegments

### ** Examples

tg <- tg.sample()
tg <- tg.removeTier(tg, "syllable")
collapsed <- paste0(tg$phone$label, collapse = "")  # get actual labels
print(collapsed)  # all labels in collapsed form - copy the string, include separators -> pattern
pattern <- "ja:-ci-P\\ek-nu-t_so-?u-J\\e-la:S- -nej-dP\\i:f-naj-deZ-h\\ut_S-ku-?a-?a-ta-ma-na:"
tg2 <- tg.duplicateTierMergeSegments(tg, "phone", 1, "syll", pattern, sep = "-")
## Not run: 
##D tg.plot(tg)
##D tg.plot(tg2)
## End(Not run)



