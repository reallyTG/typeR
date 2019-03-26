library(seqinr)


### Name: words.pos
### Title: Positions of possibly degenerated motifs within sequences
### Aliases: words.pos

### ** Examples

myseq <- "tatagaga"
words.pos("t", myseq)   # Should be 1 3
words.pos("tag", myseq) # Should be 3
words.pos("ga", myseq)  # Should be 5 7
# How to specify ambiguous base ? Look for YpR motifs by
words.pos("[ct][ag]", myseq) # Should be 1 3
#
# Show the difference with gregexpr:
#
words.pos("toto", "totototo")           # 1 3 5 (three overlapping matches)
unlist(gregexpr("toto",  "totototo")) # 1 5    (two disjoint matches)



