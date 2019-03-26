library(xgobi)


### Name: PaulKAI
### Title: Occurences of "kai" in 10 Epistels of Apostel Paul
### Aliases: PaulKAI
### Keywords: datasets

### ** Examples

data(PaulKAI)
rownames(PaulKAI) # the ten epistles researched:
##>  [1] "Rom" "Co1" "Co2" "Gal" "Phi" "Col" "Th1" "Ti1" "Ti2" "Heb"
PaulKAI # the 10 x 4 count table
mosaicplot(PaulKAI)
quadplot(PaulKAI)



