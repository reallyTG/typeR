library(blob)


### Name: blob
### Title: Construct a blob object
### Aliases: blob new_blob as.blob

### ** Examples

x1 <- charToRaw("Good morning")
x2 <- as.raw(c(0x48, 0x65, 0x6c, 0x6c, 0x6f))

new_blob(list(x1, x2))
blob(x1, x2)

as.blob(c("Good morning", "Good evening"))



