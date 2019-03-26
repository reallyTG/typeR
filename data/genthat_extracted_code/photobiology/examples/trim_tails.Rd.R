library(photobiology)


### Name: trim_tails
### Title: Trim (or expand) head and/or tail
### Aliases: trim_tails

### ** Examples

head(sun.data)
head(with(sun.data,
     trim_tails(w.length, s.e.irrad, low.limit=300)))
head(with(sun.data,
     trim_tails(w.length, s.e.irrad, low.limit=300, fill=NULL)))




