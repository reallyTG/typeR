library(accelerometry)


### Name: rle2
### Title: Run Length Encoding (Alternate Implementation)
### Aliases: rle2

### ** Examples

# Create dummie vector x
x <- c(0, 0, 0, -1, -1, 10, 10, 4, 6, 6)

# Summarize x using rle2
x.summarized <- rle2(x)

# Repeat, but also record start/stop indices for each run
x.summarized <- rle2(x = x, indices = TRUE)





