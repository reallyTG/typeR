library(emuR)


### Name: make.seglist
### Title: Make an Emu segment list from the various components
### Aliases: make.seglist
### Keywords: misc

### ** Examples



   l <- c("A", "B", "C")
   s <- 1:3
   e <- 2:4
   u <- c("u1", "u1", "u1")
   segs <- make.seglist(l, s, e, u, "Fake Query", "segment", "fake")
   segs
   ## summary gives an overview of the data in the segment list
   summary(segs)
   

   # The following should be TRUE
   label(segs) == l
   dur(segs) == s
   end(segs) == e
   utt(segs) == u
   emusegs.database(segs) == "fake"
   emusegs.type(segs) == "segment"
   emusegs.query(segs) == "Fake Query"

   # segment durations should all be 1
   dur(segs) == c(1,1,1)





