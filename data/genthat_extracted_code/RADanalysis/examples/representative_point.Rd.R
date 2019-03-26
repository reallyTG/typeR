library(RADanalysis)


### Name: representative_point
### Title: Computes representative point based on the coordinates of points
###   which are in the same group.
### Aliases: representative_point

### ** Examples

line_cols <- c("green","red","blue")
sample_classes <- c(1,1,1,1,2,2,3,3,1,1,2,3,3,1,1,2,3,3)
maxrank <- 400
data("gut_nrads")
nrads <- gut_nrads
nrads <- nrads$norm_matrix

#distance matrix using manhattan distance
d <- dist(x = nrads,method = "manhattan")
#ordination using classical multi-dimensional scaling
mds <- cmdscale(d = d,k = 5,eig = TRUE)

#plot the points
plot(mds$points,xlab = "First coordinate",ylab = "Second coordinate",pch = 19,cex =1,
    col = line_cols[sample_classes],
    main = "MDS plot with representative points \n of each group and error bars")

#add the representative points wit erorr bar to the previous plot
a <- representative_point(input = mds$points,ids = which(sample_classes == 1),
    col = scales::alpha(line_cols[1],0.5),
    plot = TRUE,standard_error_mean = TRUE,pch = 19, cex = 4)
a <- representative_point(input = mds$points,ids = which(sample_classes == 2),
    col = scales::alpha(line_cols[2],0.5),
    plot = TRUE,standard_error_mean = TRUE,pch = 19, cex = 4)
a <- representative_point(input = mds$points,ids = which(sample_classes == 3),
    col = scales::alpha(line_cols[3],0.5),
    plot = TRUE,standard_error_mean = TRUE,pch = 19, cex = 4)

legend("bottomleft",bty = "n",legend = c("pre Cp","under Cp","post Cp"),
    col = line_cols,pch = 19)




