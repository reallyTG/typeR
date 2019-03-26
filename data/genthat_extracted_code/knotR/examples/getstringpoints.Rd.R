library(knotR)


### Name: getstringpoints
### Title: Returns the coordinates of a knot's path
### Aliases: getstringpoints

### ** Examples

plot(getstringpoints(k4_1),asp=1)

a <- getstringpoints(k11a179,TRUE)
plot(a,asp=1,col=rainbow(24)[a[,3]])
 
d <- 1200
plot(rbind(
    sweep(getstringpoints(k7_1),2,c(0,0)),
    sweep(getstringpoints(k7_2),2,c(0,d)),
    sweep(getstringpoints(k7_3),2,c(d,0)),
    sweep(getstringpoints(k7_4),2,c(d,d))
),asp=1,xlab='',ylab='')




