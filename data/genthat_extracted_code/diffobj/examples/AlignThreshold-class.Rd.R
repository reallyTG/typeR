library(diffobj)


### Name: AlignThreshold-class
### Title: Controls How Lines Within a Diff Hunk Are Aligned
### Aliases: AlignThreshold-class AlignThreshold

### ** Examples

a1 <- AlignThreshold(threshold=0)
a2 <- AlignThreshold(threshold=1)
a3 <- AlignThreshold(threshold=0, min.chars=2)
## Note how "e f g" is aligned
diffChr(c("a b c e", "d e f g"), "D e f g", align=a1, pager="off")
## But now it is not
diffChr(c("a b c e", "d e f g"), "D e f g", align=a2, pager="off")
## "e f" are not enough chars to align
diffChr(c("a b c", "d e f"), "D e f", align=a1, pager="off")
## Override with min.chars, so now they align
diffChr(c("a b c", "d e f"), "D e f", align=a3, pager="off")



