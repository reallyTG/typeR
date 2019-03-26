library(bio3d)


### Name: rle2
### Title: Run Length Encoding with Indices
### Aliases: rle2 print.rle2
### Keywords: manip

### ** Examples

x <- rev(rep(6:10, 1:5))
rle(x)
## lengths [1:5]  5 4 3 2 1
## values  [1:5] 10 9 8 7 6
rle2(x)
## lengths: int [1:5] 5 4 3 2 1
## values : int [1:5] 10 9 8 7 6
## indices: int [1:5] 5 9 12 14 15



