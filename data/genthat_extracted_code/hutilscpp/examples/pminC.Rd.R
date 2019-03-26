library(hutilscpp)


### Name: pminC
### Title: Parallel minimum
### Aliases: pminC pmin0 pminV pmin3

### ** Examples

pminV(10:1, 1:10)
pmin0(-5:5)
seq_out <- function(x, y) seq(x, y, length.out = 10)
pmin3(seq_out(0, 10), seq_out(-5, 50), seq_out(20, -10))




