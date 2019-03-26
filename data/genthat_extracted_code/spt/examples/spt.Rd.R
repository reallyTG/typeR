library(spt)


### Name: spt
### Title: Sierpinski Pedal Triangle
### Aliases: spt plot.spt print.spt
### Keywords: stats

### ** Examples


(abc = spt(50,60))
plot(abc, iter=7)

(abc = spt(50,10))
plot(abc, iter=3)
abc$viewport = c(0,-70,84,100)
plot(abc, iter=6)




