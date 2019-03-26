library(mpoly)


### Name: bezier
### Title: Bezier polynomials
### Aliases: bezier

### ** Examples


p1 <- c(0,  0)
p2 <- c(1,  1)
p3 <- c(2, -1)
p4 <- c(3,  0)
bezier(p1, p2, p3, p4)


points <- data.frame(x = 0:3, y = c(0,1,-1,0))
bezier(points)


points <- data.frame(x = 0:2, y = c(0,1,0))
bezier(points)







# visualize the bernstein polynomials

library(ggplot2); theme_set(theme_bw())

s <- seq(0, 1, length.out = 101) 



## example 1
points <- data.frame(x = 0:3, y = c(0,1,-1,0))
(bezPolys <- bezier(points))

f <- as.function(bezPolys)
df <- as.data.frame(f(s))

ggplot(aes(x = x, y = y), data = df) + 
  geom_point(data = points, color = "red") +
  geom_path(data = points, color = "red") +
  geom_path()
  
  
  
  
## example 1 with weights
f <- as.function(bezPolys, weights = c(1,5,5,1))
df <- as.data.frame(f(s))

ggplot(aes(x = x, y = y), data = df) + 
  geom_point(data = points, color = "red") +
  geom_path(data = points, color = "red") +
  geom_path()
  
  
  
  
  
## example 2
points <- data.frame(x = 0:2, y = c(0,1,0))
(bezPolys <- bezier(points))
f <- as.function(bezPolys)
df <- as.data.frame(f(s))

ggplot(aes(x = x, y = y), data = df) + 
  geom_point(data = points, color = "red") +
  geom_path(data = points, color = "red") +
  geom_path()




## example 3
points <- data.frame(x = c(-1,-2,2,1), y = c(0,1,1,0))
(bezPolys <- bezier(points))
f <- as.function(bezPolys)
df <- as.data.frame(f(s))

ggplot(aes(x = x, y = y), data = df) + 
  geom_point(data = points, color = "red") +
  geom_path(data = points, color = "red") +
  geom_path()
  
  
  
  
## example 4
points <- data.frame(x = c(-1,2,-2,1), y = c(0,1,1,0))
(bezPolys <- bezier(points))
f <- as.function(bezPolys)
df <- as.data.frame(f(s))

ggplot(aes(x = x, y = y), data = df) + 
  geom_point(data = points, color = "red") +
  geom_path(data = points, color = "red") +
  geom_path()
  
  
  
  
## example 5
qplot(speed, dist, data = cars)

s <- seq(0, 1, length.out = 201) 
p <- bezier(cars)
f <- as.function(p)
df <- as.data.frame(f(s))
qplot(speed, dist, data = cars) +
  geom_path(data = df, color = "red")

# the curve is not invariant to permutations of the points
# but it always goes through the first and last points
permute_rows <- function(df) df[sample(nrow(df)),]  
p <- bezier(permute_rows(cars))
f <- as.function(p)
df <- as.data.frame(f(s))
qplot(speed, dist, data = cars) +
  geom_path(data = df, color = "red")






