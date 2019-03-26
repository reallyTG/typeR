library(seqinr)


### Name: words
### Title: To get all words from an alphabet.
### Aliases: words
### Keywords: utilities

### ** Examples

#
# Get all 64 codons:
#
stopifnot(all(words() ==
c("aaa", "aac", "aag", "aat", "aca", "acc", "acg", "act", "aga", "agc", "agg", 
   "agt", "ata", "atc", "atg", "att","caa", "cac", "cag", "cat", "cca", "ccc", 
   "ccg", "cct", "cga", "cgc", "cgg", "cgt", "cta", "ctc", "ctg", "ctt", "gaa",
   "gac", "gag", "gat", "gca", "gcc", "gcg", "gct", "gga", "ggc", "ggg", "ggt", 
   "gta", "gtc", "gtg", "gtt", "taa", "tac", "tag", "tat", "tca", "tcc", "tcg", 
   "tct", "tga", "tgc", "tgg", "tgt", "tta", "ttc", "ttg", "ttt")))
#
# Get all codons with u c a g for bases:
#
words(alphabet = s2c("ucag"))
#
# Get all tetranucleotides:
#
words(length = 4)
#
# Get all dipeptides:
#
words(length = 2, alphabet = a()[-1])



