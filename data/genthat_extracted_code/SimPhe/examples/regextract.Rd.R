library(SimPhe)


### Name: regextract
### Title: Extract (sub)strings matching regex pattern
### Aliases: regextract

### ** Examples

s <- "Test: A1 BC23 DEF456"
pattern = "([[:alpha:]]+)([[:digit:]]+)"
regextract(s, pattern)

# equivalent to this example from the help page for grep()
lapply(regmatches(s, gregexpr(pattern, s)), function(e) regmatches(e, regexec(pattern, e)))



