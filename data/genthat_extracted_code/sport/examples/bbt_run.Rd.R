library(sport)


### Name: bbt_run
### Title: BBT rating algorithm
### Aliases: bbt_run

### ** Examples

# Example from Glickman
data <- data.frame( name = c( "A", "B", "C", "D" ), 
                    rank = c( 3, 4, 1, 2 ))
bbt <- bbt_run( rank ~ name, data )



