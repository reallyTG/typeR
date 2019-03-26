library(SDMTools)


### Name: compare.matrix
### Title: Biplot Comparison of Matrices
### Aliases: compare.matrix

### ** Examples

#create some simple objects of class 'asc'
tasc = as.asc(matrix(rep(x=1:10, times=1000),nr=100)); print(tasc)
#modify the asc objects so that they are slightly different
tasc1 = tasc + runif(n = 10000, min = -1, max = 1)
tasc2 = tasc + rnorm(n = 10000, mean = 1, sd = 1)

#create some images
#basic plot showing the density of data combinations shared
#by the two matrices
compare.matrix(tasc1,tasc2,20)

#same as previous but with data partioned amoung more bins
compare.matrix(tasc1,tasc2,50)

#same as previous but altering the number of contour levels
#and adding more graphical functions
compare.matrix(tasc1,tasc2,50,nlevels=5, xlab='asc1',ylab='asc2',
  main='Comparison between asc and asc2', bg="grey")



