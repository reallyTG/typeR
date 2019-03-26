library(RRPP)


### Name: rrpp.data.frame
### Title: Create a data frame for lm.rrpp analysis
### Aliases: rrpp.data.frame
### Keywords: utilities

### ** Examples

# Why use a rrpp.data.frame?
y <- matrix(rnorm(30), 10, 3)
x <- rnorm(10)
df <- data.frame(x = x, y = y)
df
rdf <- rrpp.data.frame(x = x, y = y)
rdf # looks more like a list

is.list(df)
is.list(rdf)

d <- dist(y) # distance matrix as data

# One can try this but it will result in an error
# df <- data.frame(df, d = d) 
rdf <- rrpp.data.frame(rdf, d = d) # works

fit <- lm.rrpp(d ~ x, data = rdf)
summary(fit)



