library(LSAfun)


### Name: plausibility
### Title: Compute word (or compound) plausibility
### Aliases: plausibility

### ** Examples
data(wonderland)

plausibility("cheshire cat",method="n_density",n=10,tvectors=wonderland) 

plausibility(compose("mad","hatter",method="Multiply",tvectors=wonderland),
method="proximity",stem="hatter",tvectors=wonderland)


