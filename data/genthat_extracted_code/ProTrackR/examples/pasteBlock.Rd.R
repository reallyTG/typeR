library(ProTrackR)


### Name: pasteBlock
### Title: Paste a block of PTCell data into a PTPattern
### Aliases: pasteBlock pasteBlock,PTPattern,matrix,numeric,numeric-method

### ** Examples

data("mod.intro")

block <- PTBlock(PTPattern(mod.intro, 1), 1:16, 1)

## Do some operations using lapply (the effect
## code is set to "C10"):
block <- matrix(lapply(block, function(x) {(effect(x) <- "C10"); x}),
                nrow(block), ncol(block), byrow = TRUE)

## Paste block back on the same position:
PTPattern(mod.intro, 1) <-
  pasteBlock(PTPattern(mod.intro, 1), block, 1, 1)

## You can also paste the block anywhere you like:
PTPattern(mod.intro, 1) <-
  pasteBlock(PTPattern(mod.intro, 1), block, 49, 2)




