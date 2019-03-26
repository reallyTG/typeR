library(doBy)


### Name: data-haldCement
### Title: Heat development in cement under hardening.
### Aliases: data-haldCement haldCement
### Keywords: datasets

### ** Examples


data(haldCement)

if( interactive() ){
pairs( haldCement )
}
m <- lm( y ~ x1 + x2 + x3 + x4, data=haldCement )
summary( m )

# Notice: The model explains practically all variation in data;
# yet none of the explanatory variables appear to be statistically
# significant...




