library(mpoly)


### Name: laguerre
### Title: Generalized Laguerre polynomials
### Aliases: laguerre

### ** Examples


laguerre(0)
laguerre(1)
laguerre(2)
laguerre(3)
laguerre(4)
laguerre(5)
laguerre(6)

laguerre(2)
laguerre(2, normalized = TRUE)

laguerre(0:5) 
laguerre(0:5, normalized = TRUE)
laguerre(0:5, indeterminate = "t")



# visualize the laguerre polynomials

library(ggplot2); theme_set(theme_classic())
library(tidyr)

s <- seq(-5, 20, length.out = 201)
N <- 5 # number of laguerre polynomials to plot
(lagPolys <- laguerre(0:N))

# see ?bernstein for a better understanding of
# how the code below works

df <- data.frame(s, as.function(lagPolys)(s))
names(df) <- c("x", paste0("L_", 0:N))
mdf <- gather(df, degree, value, -x)
qplot(x, value, data = mdf, geom = "line", color = degree)

qplot(x, value, data = mdf, geom = "line", color = degree) +
  coord_cartesian(ylim = c(-25, 25))





