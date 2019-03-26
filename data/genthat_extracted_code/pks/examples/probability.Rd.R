library(pks)


### Name: probability
### Title: Problems in Elementary Probability Theory
### Aliases: probability
### Keywords: datasets

### ** Examples

data(probability)

## "Completer" sample
pb <- probability[!is.na(probability$b201), ]

## Response frequencies for first and second part
N.R1 <- as.pattern(pb[, sprintf("b1%.2i", 1:12)], freq = TRUE)
N.R2 <- as.pattern(pb[, sprintf("b2%.2i", 1:12)], freq = TRUE)

## Conjunctive skill function, one-to-one problem function
sf1 <- read.table(header = TRUE, text = "
  item cp id pb un
     1  0  0  1  0
     2  1  0  0  0
     3  0  0  0  1
     4  0  1  0  0
     5  1  0  1  0
     6  1  0  1  0
     7  0  0  1  1
     8  0  0  1  1
     9  0  1  1  0
    10  1  1  0  0
    11  1  1  1  0
    12  0  1  1  1
")

## Extended skill function
sf2 <- rbind(sf1, read.table(header = TRUE, text = "
  item cp id pb un
     2  0  0  0  1
     3  1  0  0  0
     6  0  0  1  1
     7  1  0  1  0
    12  1  1  1  0
"))

## Delineated knowledge structures
K1 <- delineate(sf1)$K
K2 <- delineate(sf2)$K

## After instructions, fit of knowledge structures improves
sapply(list(N.R1, N.R2), function(n) blim(K1, n)$discrepancy)
sapply(list(N.R1, N.R2), function(n) blim(K2, n)$discrepancy)



