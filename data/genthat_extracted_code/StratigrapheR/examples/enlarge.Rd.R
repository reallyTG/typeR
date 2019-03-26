library(StratigrapheR)


### Name: enlarge
### Title: Expands the TRUE values of a T/F vector to their nth neighbours
### Aliases: enlarge

### ** Examples

# Creating a test dataset ----

y <- c(rep(c(0,1,0,-1),8),rep(-1,3),-1.5,
           rep(-1,2),rep(c(0,1,0,-1),8))
x <- 1:length(y)

df <- data.frame(x,y)

xclip <- c(20,48.5)
yclip <- c(-0.5,1.5)

conditions <- df$y > yclip[1] & df$y < yclip[2] &
              df$x > xclip[1] & df$x < xclip[2]

normt <- df[conditions,]

# Plotting supporting data ----

plot(df$x, df$y, type = "l", lty = 2, ylim = c(-2,2))

rect(xclip[1], yclip[1], xclip[2], yclip[2])

# See how the function reacts ----

embiggened <- enlarge(conditions,1)

test  <- df[embiggened,]

lines(test$x,test$y, lwd = 2, col = "blue")

points(normt$x,normt$y, type = "o", pch = 19,
       lty = 2, lwd= 2, col = "red")


legend(10, -1.6,
       legend = c(paste("Points initally isolated: they were chosen",
                        "to be the ones inside the rectangle"),
                  paste("Extension of the points: the first neighbours",
                        "of the points were added")),
       col = c("red", "blue"), pch = 19, lty = c(2,1), lwd = 2)




