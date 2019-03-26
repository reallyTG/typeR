library(fBasics)


### Name: Heaviside
### Title: Haviside and Related Functions
### Aliases: Heaviside Sign Delta Boxcar Ramp
### Keywords: programming

### ** Examples

## Heaviside -
   x = sort(round(c(-1, -0.5, 0, 0.5, 1, 5*rnorm(5)), 2))
   h = Heaviside(x)
    
## Sign -
   s = Sign(x)
   
## Delta -
   d = Delta(x)
   
## Boxcar -
   Pi = Boxcar(x)

## Ramp - 
   r = Ramp(x)
   cbind(x = x, Step = h, Signum = s, Delta = d, Pi = Pi, R = r)        



