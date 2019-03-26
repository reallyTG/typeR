library(untb)


### Name: volkov
### Title: Expected frequency of species
### Aliases: volkov
### Keywords: math

### ** Examples

## Not run: 
##D   volkov(J=21457,c(theta=47.226, m=0.1)) # Example in figure 1
## End(Not run) 

volkov(J=20,params=c(theta=1,m=0.4))

 data(butterflies)
 r <- plot(preston(butterflies,n=9,orig=TRUE))

 ## Not run:   jj <- optimal.params(butterflies)    # needs PARI/GP

 jj <- c(9.99980936124759, 0.991791987473506)

 points(r,volkov(no.of.ind(butterflies), jj, bins=TRUE),type="b")
 



