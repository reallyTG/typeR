library(sport)


### Name: glicko_run
### Title: Glicko rating algorithm
### Aliases: glicko_run

### ** Examples

# Example from Glickman
data <- data.frame( name = c( "A", "B", "C", "D" ), 
                    rank = c( 3, 4, 1, 2 ))
glicko <- glicko_run( rank ~ name, data )



