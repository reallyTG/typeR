library(mpoly)


### Name: bernstein
### Title: Bernstein polynomials
### Aliases: bernstein

### ** Examples


bernstein(0, 0)

bernstein(0, 1)
bernstein(1, 1)

bernstein(0, 1, "t")

bernstein(0:2, 2)
bernstein(0:3, 3)
bernstein(0:3, 3, "t")


bernstein(0:4, 4)
bernstein(0:10, 10)
bernstein(0:10, 10, "t")
bernstein(0:20, 20, "t")

## Not run: 
##D   # visualize the bernstein polynomials
##D 
##D library(ggplot2); theme_set(theme_classic())
##D library(tidyr)
##D 
##D s <- seq(0, 1, length.out = 101)
##D N <- 10 # number of bernstein polynomials to plot
##D (bernPolys <- bernstein(0:N, N))
##D 
##D df <- data.frame(s, as.function(bernPolys)(s))
##D names(df) <- c("x", paste0("B_", 0:N))
##D head(df)
##D 
##D mdf <- gather(df, degree, value, -x)
##D head(mdf)
##D 
##D qplot(x, value, data = mdf, geom = "line", color = degree)
##D 
## End(Not run)




