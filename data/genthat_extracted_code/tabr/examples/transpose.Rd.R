library(tabr)


### Name: transpose
### Title: Transpose pitch
### Aliases: transpose tp

### ** Examples

transpose("a_3 b_4 c5", 0)
tp("a_3 b_4 c5", -1)
tp("a_3 b_4 c5", 1)
tp("a#3 b4 c#5", 11)
tp("a#3 b4 c#5", 12)
tp("a#3 b4 c#5", 13)
tp("a3 b4 c5", 2, key = "f")
tp("a3 b4 c5", 2, key = "g")
tp("a b' c''", 2, key = "flat")
tp("a, b ceg", 2, key = "sharp")



