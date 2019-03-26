library(sport)


### Name: glicko2_run
### Title: Glicko2 rating algorithm
### Aliases: glicko2_run

### ** Examples

# Example from Glickman
data <- data.frame( name = c( "A", "B", "C", "D" ), 
                    rank = c( 3, 4, 1, 2 ))
glicko2 <- glicko2_run( rank ~ name, data )



