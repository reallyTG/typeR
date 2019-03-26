library(soundgen)


### Name: matchLengths
### Title: Resize vector to required length
### Aliases: matchLengths
### Keywords: internal

### ** Examples

soundgen:::matchLengths(c(1, 2, 3), len = 5)
soundgen:::matchLengths(3:7, len = 3)
# trimmed on the left
soundgen:::matchLengths(3:7, len = 3, padDir = 'left')
# padded with zeros on the left
soundgen:::matchLengths(3:7, len = 10, padDir = 'left')
#' # trimmed on the right
soundgen:::matchLengths(3:7, len = 3, padDir = 'right')
# padded with zeros on the right
soundgen:::matchLengths(3:7, len = 10, padDir = 'right')



