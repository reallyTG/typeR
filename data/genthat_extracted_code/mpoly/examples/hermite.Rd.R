library(mpoly)


### Name: hermite
### Title: Hermite polynomials
### Aliases: hermite

### ** Examples


hermite(0)
hermite(1)
hermite(2)
hermite(3)
hermite(4)
hermite(5)
hermite(6)
hermite(10)

hermite(0:5) 
hermite(0:5, normalized = TRUE)
hermite(0:5, indeterminate = "t")



# visualize the hermite polynomials

library(ggplot2); theme_set(theme_classic())
library(tidyr)

s <- seq(-3, 3, length.out = 201)
N <- 5 # number of hermite polynomials to plot
(hermPolys <- hermite(0:N))

# see ?bernstein for a better understanding of
# how the code below works

df <- data.frame(s, as.function(hermPolys)(s))
names(df) <- c("x", paste0("T_", 0:N))
mdf <- gather(df, degree, value, -x)
qplot(x, value, data = mdf, geom = "line", color = degree)






