library(smirnov)


### Name: smirnov
### Title: smirnov
### Aliases: smirnov
### Keywords: classif

### ** Examples

# Example (21) from p. 45 of Smirnov's book:
s1 <- c(0,1,0,1,0,1,0,1,0,1,1,0,1,0,0)
s2 <- c(0,1,0,1,0,1,1,0,1,0,0,1,0,1,0)
s3 <- c(1,0,1,0,1,0,0,1,0,1,0,1,0,0,1)
smirnov(rbind(s1, s2, s3))
# s3 is most original; s1 and s2 are more similar than other pairs



