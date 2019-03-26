library(seqinr)


### Name: syncodons
### Title: Synonymous codons
### Aliases: syncodons
### Keywords: utilities

### ** Examples

#
# The four synonymous codons for Alanine in the standard genetic code:
#
syncodons("ggg")
#
# With a sequence:
#
toycds <- s2c("tctgagcaaataaatcgg")
syncodons(splitseq(toycds))
#
# Sanity check with the standard genetic code:
#
stdgencode <- structure(list(
  ttt = c("ttc", "ttt"), 
  ttc = c("ttc", "ttt"), 
  tta = c("cta", "ctc", "ctg", "ctt", "tta", "ttg"),
  ttg = c("cta", "ctc", "ctg", "ctt", "tta", "ttg"), 
  tct = c("agc", "agt", "tca", "tcc", "tcg", "tct"), 
  tcc = c("agc", "agt", "tca", "tcc", "tcg", "tct"), 
  tca = c("agc", "agt", "tca", "tcc", "tcg", "tct"), 
  tcg = c("agc", "agt", "tca", "tcc", "tcg", "tct"),
  tat = c("tac", "tat"), 
  tac = c("tac", "tat"), 
  taa = c("taa", "tag", "tga"),
  tag = c("taa", "tag", "tga"),
  tgt = c("tgc", "tgt"),
  tgc = c("tgc", "tgt"),
  tga = c("taa", "tag", "tga"), 
  tgg = "tgg", 
  ctt = c("cta", "ctc", "ctg", "ctt", "tta", "ttg"), 
  ctc = c("cta", "ctc", "ctg", "ctt", "tta", "ttg"), 
  cta = c("cta", "ctc", "ctg", "ctt", "tta", "ttg"),
  ctg = c("cta", "ctc", "ctg", "ctt", "tta", "ttg"), 
  cct = c("cca", "ccc", "ccg", "cct"), 
  ccc = c("cca", "ccc", "ccg", "cct"), 
  cca = c("cca", "ccc", "ccg", "cct"), 
  ccg = c("cca", "ccc", "ccg", "cct"), 
  cat = c("cac", "cat"), 
  cac = c("cac", "cat"), 
  caa = c("caa", "cag"),
  cag = c("caa", "cag"),
  cgt = c("aga", "agg", "cga", "cgc", "cgg", "cgt"),
  cgc = c("aga", "agg", "cga", "cgc", "cgg", "cgt"),
  cga = c("aga", "agg", "cga", "cgc", "cgg", "cgt"),
  cgg = c("aga", "agg", "cga", "cgc", "cgg", "cgt"), 
  att = c("ata", "atc", "att"),
  atc = c("ata", "atc", "att"),
  ata = c("ata", "atc", "att"),
  atg = "atg",
  act = c("aca", "acc", "acg", "act"), 
  acc = c("aca", "acc", "acg", "act"),
  aca = c("aca", "acc", "acg", "act"),
  acg = c("aca", "acc",  "acg", "act"), 
  aat = c("aac", "aat"), 
  aac = c("aac", "aat"), 
  aaa = c("aaa", "aag"),
  aag = c("aaa", "aag"),
  agt = c("agc", "agt", "tca", "tcc", "tcg", "tct"),
  agc = c("agc", "agt", "tca", "tcc", "tcg", "tct"),
  aga = c("aga", "agg", "cga", "cgc", "cgg", "cgt"),
  agg = c("aga", "agg", "cga", "cgc", "cgg", "cgt"),
  gtt = c("gta", "gtc", "gtg", "gtt"),
  gtc = c("gta", "gtc", "gtg", "gtt"),
  gta = c("gta", "gtc", "gtg", "gtt"), 
  gtg = c("gta", "gtc", "gtg", "gtt"),
  gct = c("gca", "gcc", "gcg", "gct"),
  gcc = c("gca", "gcc", "gcg", "gct"),
  gca = c("gca", "gcc", "gcg", "gct"),
  gcg = c("gca", "gcc", "gcg", "gct"), 
  gat = c("gac", "gat"),
  gac = c("gac", "gat"),
  gaa = c("gaa", "gag"),
  gag = c("gaa", "gag"),
  ggt = c("gga", "ggc", "ggg", "ggt"),
  ggc = c("gga", "ggc", "ggg", "ggt"),
  gga = c("gga", "ggc", "ggg", "ggt"),
  ggg = c("gga", "ggc", "ggg", "ggt")),

.Names = c("ttt", "ttc", "tta", "ttg", "tct", "tcc", "tca", "tcg", "tat", "tac", 
"taa", "tag", "tgt", "tgc", "tga", "tgg", "ctt", "ctc", "cta", 
"ctg", "cct", "ccc", "cca", "ccg", "cat", "cac", "caa", "cag", 
"cgt", "cgc", "cga", "cgg", "att", "atc", "ata", "atg", "act", 
"acc", "aca", "acg", "aat", "aac", "aaa", "aag", "agt", "agc", 
"aga", "agg", "gtt", "gtc", "gta", "gtg", "gct", "gcc", "gca", 
"gcg", "gat", "gac", "gaa", "gag", "ggt", "ggc", "gga", "ggg"))
#
# Now the check:
#
currentresult <- syncodons(words(alphabet = s2c("tcag")))
stopifnot(identical(stdgencode, currentresult))



