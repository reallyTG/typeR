library(seg)


### Name: deseg
### Title: Decomposable Segregation Measure
### Aliases: deseg

### ** Examples

# uses the idealised landscapes in 'segdata'
data(segdata)
grd <- GridTopology(cellcentre.offset=c(0.5,0.5),
                    cellsize=c(1,1), cells.dim=c(10,10))
grd.sp <- as.SpatialPolygons.GridTopology(grd)

# displays the test data
plot(grd.sp)
plot(grd.sp[segdata[,9] == 100,], col = "Black", add = TRUE)
plot(grd.sp[segdata[,9] == 50,], col = "Grey", add = TRUE)

# tries different bandwidths for the same data
bw1 <- deseg(grd.sp, segdata[,9:10], sigma = 1, nrow = 20, ncol = 20)
print(bw1, digits = 3)
bw1.val <- sum(as.vector(bw1))
spplot(bw1, col.regions=rev(heat.colors(20)), 
       main = paste("Bandwidth = 1, S =", round(bw1.val, 2)))

bw2 <- deseg(grd.sp, segdata[,9:10], sigma = 2, nrow = 20, ncol = 20)
print(bw2, digits = 3)
bw2.val <- sum(as(bw2, "vector"))
spplot(bw2, col.regions=rev(heat.colors(20)), 
       main = paste("Bandwidth = 2, S =", round(bw2.val, 2)))

## Not run: 
##D # let's see how the index value changes with different bandwidths
##D h0 <- seq(1, 5, length.out = 10); vals <- numeric()
##D for (i in 1:10) {
##D   d <- deseg(grd.sp, segdata[,9:10], sigma = h0[i], verbose = TRUE)
##D   vals <- append(vals, sum(as(d, "vector")))
##D }
##D plot(h0, vals, type = "b", xlab = "Bandwidth", ylab = "S")
##D title(main = "segdata[,9:10]")
##D 
##D # calculates the index for all data sets in 'segdata'
##D d.segdata <- matrix(NA, nrow = 3, ncol = 8)
##D for (i in 1:8) {
##D   idx <- 2 * i
##D   tmp <- deseg(grd.sp, segdata[,(idx-1):idx])
##D   d.segdata[,i] <- as(tmp, "vector")
##D }
##D 
##D # presents the results as a bar chart
##D barplot(d.segdata, names.arg = LETTERS[1:8], main = "segdata",
##D         legend.text = c(expression(italic(paste("S"[L]))), 
##D                         expression(italic(paste("S"[C]))),
##D                         expression(italic(paste("S"[Q])))),
##D         args.legend = list(x = "topright", horiz = TRUE))
## End(Not run)



