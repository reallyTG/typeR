## ---- include=F----------------------------------------------------------
load("../data/candidate_rxlr.RData")

## ------------------------------------------------------------------------
library(effectR)
pkg <- "effectR"
fasta.file <- system.file("extdata", "test_infestans.fasta", package = pkg)
library(seqinr)
ORF <- read.fasta(fasta.file)
head(ORF, n = 2)

## ------------------------------------------------------------------------
REGEX <- regex.search(sequence = ORF, motif = "RxLR")
length(REGEX)

## ------------------------------------------------------------------------
reg.pat <- "^\\w{50,60}[w,v]"
REGEX <- regex.search(sequence = ORF, motif = "custom", reg.pat = reg.pat)
length(REGEX)

## ---- eval=FALSE---------------------------------------------------------
#  candidate.rxlr <- hmm.search(original.seq = fasta.file, regex.seq = REGEX, mafft.path = "/usr/local/bin/", hmm.path = "/usr/local/bin/")

## ---- eval=F-------------------------------------------------------------
#  head(candidate.rxlr$REGEX, n = 2)

## ---- eval=F-------------------------------------------------------------
#  head(candidate.rxlr$HMM, n = 2)

## ---- eval=F-------------------------------------------------------------
#  head(candidate.rxlr$HMM_Table)

## ---- eval=F-------------------------------------------------------------
#  summary.list <- effector.summary(candidate.rxlr)

## ---- eval=F-------------------------------------------------------------
#  knitr::kable(summary.list$motif.table)

## ---- eval=F-------------------------------------------------------------
#  head(summary.list$motif.table, n = 2)
#  length(summary.list$consensus.sequences)

## ---- eval=F-------------------------------------------------------------
#  write.fasta(sequences = getSequence(summary.list$consensus.sequences), names = getName(summary.list$consensus.sequences), file.out = "RxLR_candidates.fasta")

## ---- eval=F, fig.width=12, fig.height=7---------------------------------
#  hmm.logo(hmm.table = candidate.rxlr$HMM_Table)

