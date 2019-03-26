library(gdata)


### Name: first
### Title: Return first or last element of an object
### Aliases: first last first<- last<-
### Keywords: manip

### ** Examples

## works for vectors..
v <- 1:10
first(v)
last(v)

first(v) <- 9
v

last(v) <- 20
v

## and for lists
l <- list(a=1, b=2, c=3)
first(l)
last(l)

first(l) <- "apple"
last(l)  <- "bannana"
l

## and data.frames
df <- data.frame(a=1:2, b=3:4, c=5:6)
first(df)
last(df)

first(df) <- factor(c("red","green"))
last(df) <- list(c(20,30)) # note the enclosing list!
df

## and matrixes
m <- as.matrix(df)
first(m)
last(m)

first(m) <- "z"
last(m)  <- "q"
m



