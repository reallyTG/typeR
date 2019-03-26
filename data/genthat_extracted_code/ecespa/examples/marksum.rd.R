library(ecespa)


### Name: marksum
### Title: Mark-sum measure
### Aliases: marksum plot.ecespa.marksum print.ecespa.marksum
### Keywords: spatial

### ** Examples


   
 data(seedlings1)
   
 seed.m <- marksum(seedlings1, R=25)

 # raw mark-sum measure; sigma is bandwith for smoothing
 plot(seed.m, what="marksum", sigma = 5)  

 # point sum measure
 plot(seed.m, what="pointsum", sigma = 5) 
   
 # normalized  mark-sum measure
 plot(seed.m,  what="normalized", dimyx=200, contour=TRUE, sigma = 5) 

# the same with added grid and normalized  mark-sum measure
plot(seed.m,  what="normalized", dimyx=200,
      contour=TRUE, sigma = 5, grid=TRUE)





