library(LSAfun)


### Name: neighbors
### Title: Find nearest neighbors
### Aliases: neighbors

### ** Examples
data(wonderland)

neighbors("cheshire",n=20,tvectors=wonderland) 

neighbors(compose("mad","hatter",method="Add",tvectors=wonderland),
n=20,tvectors=wonderland)


