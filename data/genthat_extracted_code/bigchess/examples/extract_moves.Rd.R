library(bigchess)


### Name: extract_moves
### Title: Extract first N moves
### Aliases: extract_moves

### ** Examples

extract_moves("1. e4 e5 2. Nf3 Nf5 3. d5 ",N = 3)
# e4 e5 Nf3 Nf5 d5 NA TRUE
extract_moves("1. e4 e5 2. Nf3 Nf5 3. d5 ",N = 3, last.move = TRUE)
# e4 e5 Nf3 Nf5 d5 NA d5 TRUE



