library(vcdExtra)


### Name: expand.dft
### Title: Expand a frequency table to case form
### Aliases: expand.dft expand.table
### Keywords: manip array

### ** Examples

library(vcd)
art <- xtabs(~Treatment + Improved, data = Arthritis)
art
artdf <- expand.dft(art)
str(artdf)

# 1D case
(tab <- table(sample(head(letters), 20, replace=TRUE)))
expand.table(tab, var.names="letter")




