library(pracma)


### Name: refindall
### Title: Find overlapping regular expression matches.
### Aliases: refindall
### Keywords: string

### ** Examples

refindall("ababababa", 'aba')
gregexpr('a(?=ba)', "ababababa", perl=TRUE)

refindall("AbababaBa", 'aba')
refindall("AbababaBa", 'aba', ignorecase = TRUE)



