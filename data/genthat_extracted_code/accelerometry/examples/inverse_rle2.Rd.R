library(accelerometry)


### Name: inverse_rle2
### Title: Inverse Run Length Encoding (Alternate Implementation)
### Aliases: inverse_rle2

### ** Examples

# Create dummie vector x
x <- c(0, 0, 0, -1, -1, 10, 10, 4, 6, 6)

# Summarize x using rle2
x.summarized <- rle2(x)

# Reconstruct x
x.reconstructed <- inverse_rle2(x.summarized)





