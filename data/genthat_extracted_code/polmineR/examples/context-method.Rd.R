library(polmineR)


### Name: context
### Title: Analyze context of a node word.
### Aliases: context as.matrix,context_bundle-method
###   context,partition-method context,character-method
###   context,partition_bundle-method context,cooccurrences-method

### ** Examples

use("polmineR")
p <- partition("GERMAPARLMINI", interjection = "speech")
y <- context(p, query = "Integration", p_attribute = "word")
y <- context(p, query = "Integration", p_attribute = "word", positivelist = "Bildung")
y <- context(
  p, query = "Integration", p_attribute = "word",
  positivelist = c("[aA]rbeit.*", "Ausbildung"), regex = TRUE
)



