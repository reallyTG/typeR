library(mpoly)


### Name: as.mpoly
### Title: Convert an object to an mpoly
### Aliases: as.mpoly

### ** Examples


library(ggplot2); theme_set(theme_classic())
library(dplyr)

n <- 101
s <- seq(-5, 5, length.out = n)



# one dimensional case

df <- data.frame(x = seq(-5, 5, length.out = n)) %>% 
  mutate(y = -x^2 + 2*x - 3 + rnorm(n, 0, 2))

(mod <- lm(y ~ x + I(x^2), data = df))
(p <- as.mpoly(mod))
qplot(x, y, data = df) +
  stat_function(fun = as.function(p), colour = "red", size = 1)
  
(mod <- lm(y ~ poly(x, 2, raw = TRUE), data = df))  
(p <- as.mpoly(mod))
qplot(x, y, data = df) +
  stat_function(fun = as.function(p), colour = "red", size = 1)
  
(mod <- lm(y ~ poly(x, 1, raw = TRUE), data = df))  
(p <- as.mpoly(mod))
qplot(x, y, data = df) +
  stat_function(fun = as.function(p), colour = "red", size = 1)



# two dimensional case with ggplot2

df <- expand.grid(x = s, y = s) %>% 
  mutate(z = x^2 - y^2 + 3*x*y + rnorm(n^2, 0, 3))
qplot(x, y, data = df, geom = "raster", fill = z)

(mod <- lm(z ~ x + y + I(x^2) + I(y^2) + I(x*y), data = df))
(mod <- lm(z ~ poly(x, y, degree = 2, raw = TRUE), data = df))
(p <- as.mpoly(mod))
df$fit <- apply(df[,c("x","y")], 1, as.function(p))

qplot(x, y, data = df, geom = "raster", fill = fit)

qplot(x, y, data = df, geom = "raster", fill = z - fit) # residuals










