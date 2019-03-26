library(stackoverflow)


### Name: invwhich
### Title: Convert indices to logical vector
### Aliases: invwhich

### ** Examples


x <- rnorm(50) > 1
ix <- which(x)
all.equal(x, invwhich(ix, 50))

all.equal(
  invwhich(grep('O', state.abb), 50),
  grepl('O', state.abb)
)



