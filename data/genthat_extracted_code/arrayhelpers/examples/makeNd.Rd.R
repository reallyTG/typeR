library(arrayhelpers)


### Name: makeNd
### Title: Ensure/collapse an array into 'n' dimensions and restore the old
###   dimensions
### Aliases: makeNd restoredim

### ** Examples

v <- arrayhelpers:::v
v
makeNd (v, 1)
dim (makeNd (v, 1))
dim (makeNd (v, 3))

m <- arrayhelpers:::m
m
makeNd (m, 1)
dim (makeNd (m, 1))
makeNd (m, 0) 
dim (makeNd (m, 0))
makeNd (m, 3)

a <- arrayhelpers:::a
a
dim (makeNd (a, 1))
dim (makeNd (a, 0))
makeNd (a,  2)          
makeNd (a, -2)
makeNd (a, -4)
makeNd (a, 3);


a <- array (1 : 24, 4 : 3)
a
restoredim (makeNd (a, 0))

x <- makeNd (a, 0)
attr (x, "old")




