library(tosca)


### Name: showMeta
### Title: Export Readable Meta-Data of Articles.
### Aliases: showMeta
### Keywords: manip

### ** Examples

meta <- data.frame(id=c("A", "B", "C", "D"),
title=c("Fishing", "Don't panic!", "Sir Ronald", "Berlin"),
date=c("1885-01-02", "1979-03-04", "1951-05-06", "1967-06-02"),
additionalVariable=1:4, stringsAsFactors=FALSE)

extractedMeta <- showMeta(meta=meta, cols = c("title", "date"))




