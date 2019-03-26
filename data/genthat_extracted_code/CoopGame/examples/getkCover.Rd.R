library(CoopGame)


### Name: getkCover
### Title: Compute k-cover of game
### Aliases: getkCover

### ** Examples

library(CoopGame)
getkCover(c(0,0,0,9,9,12,18),k=1)

## No test: 
library(CoopGame)
#Example from textbook by Driessen, p. 175, with alpha = 0.6 and k = 2
alpha = 0.6
getkCover(c(0,0,0,alpha,alpha,0,1), k=2)
#[1] 0.0 0.0 0.0 0.6 0.6 0.0 1.0
## End(No test)




