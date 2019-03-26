library(protr)


### Name: removeGaps
### Title: Remove or replace gaps from protein sequences.
### Aliases: removeGaps

### ** Examples

# amino acid sequences that contain gaps ("-")
aaseq <- list(
  "MHGDTPTLHEYMLDLQPETTDLYCYEQLSDSSE-EEDEIDGPAGQAEPDRAHYNIVTFCCKCDSTLRLCVQS",
  "MHGDTPTLHEYMLDLQPETTDLYCYEQLNDSSE-EEDEIDGPAGQAEPDRAHYNIVTFCCKCDSTLRLCVQS"
)

## Not run: 
##D #' # gaps create issues for alignment
##D parSeqSim(aaseq)
##D 
##D # remove the gaps
##D nogapseq <- removeGaps(aaseq)
##D parSeqSim(nogapseq)
## End(Not run)



