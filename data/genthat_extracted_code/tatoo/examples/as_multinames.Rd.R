library(tatoo)


### Name: as_multinames
### Title: Create Composite Table multinames from a character vector
### Aliases: as_multinames

### ** Examples


dat <- data.frame(
  apple = 1,
  banana = 2,
  dog = 1,
  cat = 2,
  parrot = 3
)

multinames(dat) <- as_multinames(
  c('fruit', 'fruit', 'animal', 'animal', 'animal')
)

multinames(dat)




