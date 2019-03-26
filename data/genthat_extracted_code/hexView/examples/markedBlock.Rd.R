library(hexView)


### Name: markedBlock
### Title: Create a markedBlock Object
### Aliases: markedBlock
### Keywords: file

### ** Examples

# A single-byte integer which dictates how many
# subsequent four-byte reals to read
markedBlock(integer1,
            function(marker) {
              lengthBlock(real4, blockValue(marker))
            })



