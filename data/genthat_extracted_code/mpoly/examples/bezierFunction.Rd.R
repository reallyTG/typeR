library(mpoly)


### Name: bezierFunction
### Title: Bezier function
### Aliases: bezierFunction

### ** Examples


library(ggplot2); theme_set(theme_bw())


t <- seq(0, 1, length.out = 201)
points <- data.frame(x = 0:3, y = c(0,1,-1,0))


f <- bezierFunction(points)
df <- as.data.frame(f(t))

ggplot(aes(x = x, y = y), data = df) + 
  geom_point(data = points, color = "red", size = 8) +
  geom_path(data = points, color = "red") +
  geom_path()
  
  
  
  
f <- bezierFunction(points, weights = c(1,5,5,1))
df <- as.data.frame(f(t))

ggplot(aes(x = x, y = y), data = df) + 
  geom_point(data = points, color = "red", size = 8) +
  geom_path(data = points, color = "red") +
  geom_path()
  
  
  
  
f <- bezierFunction(points, weights = c(1,10,10,1))
df <- as.data.frame(f(t))

ggplot(aes(x = x, y = y), data = df) + 
  geom_point(data = points, color = "red", size = 8) +
  geom_path(data = points, color = "red") +
  geom_path()
  
  
  
  
  
  
  
  
  
  




