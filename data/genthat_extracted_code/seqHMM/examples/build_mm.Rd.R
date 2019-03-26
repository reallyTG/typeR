library(seqHMM)


### Name: build_mm
### Title: Build a Markov Model
### Aliases: build_mm

### ** Examples

# Construct sequence data
data("mvad", package = "TraMineR")

mvad_alphabet <-
  c("employment", "FE", "HE", "joblessness", "school", "training")
mvad_labels <- c("employment", "further education", "higher education",
  "joblessness", "school", "training")
mvad_scodes <- c("EM", "FE", "HE", "JL", "SC", "TR")
mvad_seq <- seqdef(mvad, 17:86, alphabet = mvad_alphabet,
  states = mvad_scodes, labels = mvad_labels, xtstep = 6)

# Define a color palette for the sequence data
attr(mvad_seq, "cpal") <- colorpalette[[6]]

# Estimate the Markov model
mm_mvad <- build_mm(observations = mvad_seq)




