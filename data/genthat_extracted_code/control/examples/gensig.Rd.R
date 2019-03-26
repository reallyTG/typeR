library(control)


### Name: gensig
### Title: Generate periodic signal
### Aliases: gensig

### ** Examples


## Not run:  A square wave signal 
sig <-  gensig('square', 4, 10, 0.1)
plot(sig$t, sig$u, type = "l", col = "blue")
grid(5,5, col = "lightgray")

## Not run:  A sine wave signal 

sig <-  gensig('sin')
plot(sig$t, sig$u, type = "l", col = "blue")
grid(5,5, col = "lightgray")




