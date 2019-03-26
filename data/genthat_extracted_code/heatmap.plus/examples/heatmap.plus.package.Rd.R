library(heatmap.plus)


### Name: heatmap.plus.package
### Title: Heatmap with more sensible behavior
### Aliases: heatmap.plus
### Keywords: data

### ** Examples

  z = matrix(rnorm(30),nrow=5,ncol=6);
  rlab = matrix(as.character(c(1:5,2:6,3:7,4:8)),nrow=5,ncol=4);
  clab = matrix(as.character(c(1:6,6:1)),nrow=6,ncol=2);
  colnames(rlab) = LETTERS[1:dim(rlab)[2]];
  colnames(clab) = 1:dim(clab)[2];
  heatmap.plus(z,ColSideColors=clab,RowSideColors=rlab);



