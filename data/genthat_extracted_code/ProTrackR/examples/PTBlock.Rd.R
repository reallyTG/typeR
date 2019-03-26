library(ProTrackR)


### Name: PTBlock
### Title: Select and copy a range of PTCells into a PTBlock
### Aliases: PTBlock PTBlock,PTPattern,numeric,numeric-method

### ** Examples

data("mod.intro")

## in most ProTrackR methods you can only select a single row or track.
## with a PTBlock your selection is more flexible.

## select rows 4 up to 8 and tracks 2 up to 4, from the first
## pattern table in mod.intro:

block <- PTBlock(PTPattern(mod.intro, 1), 4:8, 2:4)

## 'block' is now a matrix with in each a list with a PTCell.
## These can now easily be accessed and modified:

cell1 <- block[1, 1][[1]]

print(cell1)



