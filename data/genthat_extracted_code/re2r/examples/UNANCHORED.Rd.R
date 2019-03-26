library(re2r)


### Name: UNANCHORED
### Title: Anchors for pattern
### Aliases: UNANCHORED ANCHOR_START ANCHOR_BOTH
### Keywords: datasets

### ** Examples

re2_match("This is an apple.", "(is)",anchor = ANCHOR_BOTH)
re2_match("This is an apple.", "(is)",anchor = UNANCHORED)
re2_match("This is an apple.", "(is)",anchor = ANCHOR_START)
re2_match("This is an apple.", "(This)",anchor = ANCHOR_START)
re2_match("This is an apple.", "(This)",anchor = ANCHOR_BOTH)



