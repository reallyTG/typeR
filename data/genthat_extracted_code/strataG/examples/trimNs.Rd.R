library(strataG)


### Name: trimNs
### Title: Trim N's From Sequences
### Aliases: trimNs

### ** Examples

 test.seqs <- list(
   A = c(rep("n", 5), "a", "c", "g", "t", rep("n", 3)),
   B = c(rep("n", 3), "a", "c", "g", "t", rep("n", 5)),
   C = c("a", "c", "g", "t", rep("n", 8))
 )

test.seqs
trimmed <- trimNs(test.seqs)  
as.character(trimmed)
 



