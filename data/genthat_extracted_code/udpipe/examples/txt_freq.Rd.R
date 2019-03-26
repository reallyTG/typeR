library(udpipe)


### Name: txt_freq
### Title: Frequency statistics of elements in a vector
### Aliases: txt_freq

### ** Examples

x <- sample(LETTERS, 1000, replace = TRUE)
txt_freq(x)
x <- factor(x, levels = LETTERS)
txt_freq(x, order = FALSE)



