library(RgoogleMaps)


### Name: updateusr
### Title: Updates the 'usr' coordinates in the current plot.
### Aliases: updateusr

### ** Examples



tmp <- barplot(1:4)


updateusr(tmp[1:2], 0:1, 1:2, 0:1)


lines(1:4, c(1,3,2,2), lwd=3, type='b',col='red')





# update the y-axis to put a reference distribution line in the bottom


# quarter





tmp <- rnorm(100)


hist(tmp)


tmp2 <- par('usr')


xx <- seq(min(tmp), max(tmp), length.out=250)


yy <- dnorm(xx, mean(tmp), sd(tmp))


updateusr( tmp2[1:2], tmp2[3:4], tmp2[1:2], c(0, max(yy)*4) )


lines(xx,yy)








