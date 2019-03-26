library(R2DT)


### Name: rbindDT
### Title: Glueing, not merging, two data.table objects together, by
###   matching column names
### Aliases: rbindDT

### ** Examples

library(data.table)
inputDT <- as.data.table(data.frame(x = seq(1, 20, 2), y = LETTERS[1:10], z = LETTERS[1:10]))
inputDT2 <- as.data.table(data.frame(p = seq(1, 40, 2), x = c(LETTERS[1:10], LETTERS[1:10]),
l = c(LETTERS[1:10], LETTERS[1:10]), m = c(LETTERS[1:10], LETTERS[1:10])))

rbindDT(inputDT, inputDT2)



