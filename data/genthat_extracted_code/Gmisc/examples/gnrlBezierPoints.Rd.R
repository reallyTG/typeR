library(Gmisc)


### Name: gnrlBezierPoints
### Title: Generates a generalized Bezier line
### Aliases: gnrlBezierPoints

### ** Examples

library(grid)
grid.newpage()
l <- gnrlBezierPoints(data.frame(x = c(.1, -.1, .7, 1, 1, 0.1),
                                 y = c(.9, 0, 1, .8, .4, .1)),
                      length_out = 100)
grid.lines(l[,1], l[,2], gp=gpar(col="#550000", lwd = 4))

out_sizes <- 4:20
clrs <- colorRampPalette(c("orange", "darkblue"))(length(out_sizes))
for (i in out_sizes){
   l <- gnrlBezierPoints(data.frame(x = c(.1, -.1, .7, 1, 1, 0.1),
                                    y = c(.9, 0, 1, .8, .4, .1)),
                         length_out = i)
   grid.lines(l[,1], l[,2],
   gp=gpar(col=clrs[which(i == out_sizes)]))
}



