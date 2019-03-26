library(metap)


### Name: wilkinsonp
### Title: Combine p-values using Wilkinson's method
### Aliases: wilkinsonp maximump minimump 'Tippett's method'
###   print.wilkinsonp print.maximump print.minimump
### Keywords: htest

### ** Examples

data(beckerp)
minimump(beckerp) # signif = FALSE, critp = 0.0102, minp = 0.016
data(teachexpect)
minimump(teachexpect) # crit 0.0207, note Becker says minp = 0.0011
wilkinsonp(c(0.223, 0.223), r = 2) # Birnbaum, just signif
data(validity)
minimump(validity) # minp = 0.00001, critp = 1.99 * 10^{-4}
minimump(c(0.0001, 0.0001, 0.9999, 0.9999)) # is significant



