library(spgs)


### Name: complement
### Title: Complement of a DNA/RNA Sequence
### Aliases: complement complement.default complement.SeqFastadna
###   complement.list
### Keywords: datagen

### ** Examples

complement("actg")
complement(c("t", "g", "a"))

#List of sequences
some.dna <- list("atgcgtcgttaa", c("g", "t", "g", "a", "a", "a"))
complement(some.dna)

#RNA sequence example
complement(c("a", "u", "g"), content="rna")

#Examples of lowercase, uppercase and as-is conversion
mixed.case <- c("t", "G", "g", "C", "a")
complement(mixed.case)
complement(mixed.case, case="upper")
complement(mixed.case, case="as is")



