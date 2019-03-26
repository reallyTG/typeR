library(qlcData)


### Name: pass_align
### Title: Transfer alignment from one string to another
### Aliases: pass_align

### ** Examples

# make some strings with separators
l <- list(letters[1:3], letters[4:7], letters[10:15])
originals <- sapply(l, paste, collapse = " ")
cbind(originals)

# make some alignment
# note that this alignment is non-sensical!
alignment <- c("X - - - X - X", "X X - - - X X", "X X X - X X X")
cbind(alignment)

# match originals to the alignment
transferred <- pass_align(originals, alignment)
cbind(transferred)

# ========

# a slighly more interesting example
# using the bare-bones pairwise alignment from adist()
originals <- c("cute kitten class","utter tentacles")
cbind(originals)

# adist returns strings of pairwise Levenshtein operations
# "I" signals insertion
(levenshtein <- attr(adist(originals, counts = TRUE), "trafos"))

# pass alignments to original strings, show the insertions as "-" gaps
alignment <- c(levenshtein[1,2], levenshtein[2,1])
transferred <- pass_align(originals, alignment, 
    sep = "", in.gap = "I", out.gap = "-")
cbind(transferred)




