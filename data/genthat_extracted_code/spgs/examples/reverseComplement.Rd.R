library(spgs)


### Name: reverseComplement
### Title: Reverse Complement of a DNA/RNA Sequence
### Aliases: reverseComplement reverseComplement.default
###   reverseComplement.SeqFastadna reverseComplement.list
### Keywords: datagen

### ** Examples

reverseComplement("actg")
reverseComplement(c("t", "g", "a"))

#List of sequences
some.dna <- list("atgcgtcgttaa", c("g", "t", "g", "a", "a", "a"))
reverseComplement(some.dna)

#RNA sequence example
reverseComplement(c("a", "u", "g"), content="rna")

#Examples of lowercase, uppercase and as-is conversion
mixed.case <- c("t", "G", "g", "C", "a")
reverseComplement(mixed.case)
reverseComplement(mixed.case, case="upper")
reverseComplement(mixed.case, case="as is")



