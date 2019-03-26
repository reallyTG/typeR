library(reinforcelearn)


### Name: tiles
### Title: Tile Coding
### Aliases: tiles iht

### ** Examples

# Create hash table
hash = iht(1024)

# Partition state space using 8 tilings
tiles(hash, n.tilings = 8, state = c(3.6, 7.21))
tiles(hash, n.tilings = 8, state = c(3.7, 7.21))
tiles(hash, n.tilings = 8, state = c(4, 7))
tiles(hash, n.tilings = 8, state = c(- 37.2, 7))




