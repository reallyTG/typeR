library(seqinr)


### Name: splitseq
### Title: split a sequence into sub-sequences
### Aliases: splitseq
### Keywords: manip

### ** Examples

cds <- s2c("aacgttgcaggtcgctcgctacgtagctactgttt")
#
# To obtain the codon sequence in frame 0:
#
stopifnot(identical(splitseq(cds), 
  c("aac", "gtt", "gca", "ggt", "cgc", "tcg", "cta", "cgt", "agc", "tac", "tgt")))
#
# Show the effect of frame and word with a ten char sequence:
#
(tenchar <- s2c("1234567890"))
splitseq(tenchar, frame = 0)
splitseq(tenchar, frame = 1)
splitseq(tenchar, frame = 2)
splitseq(tenchar, frame = 0, word = 2)
splitseq(tenchar, frame = 0, word = 1)



