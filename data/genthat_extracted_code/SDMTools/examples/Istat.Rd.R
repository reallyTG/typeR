library(SDMTools)


### Name: Istat
### Title: I Similarity Statistic for Quantifying Niche Overlap
### Aliases: Istat

### ** Examples

#create some simple objects of class 'asc'
tasc = as.asc(matrix(1:50,nr=50,nc=50)); print(tasc)
#modify the asc objects so that they are slightly different
tasc1 = tasc + runif(n = 2500, min = -1, max = 1)
tasc2 = tasc + rnorm(n = 2500, mean = 1, sd = 1)

#ensure all data is positive
tasc1 = abs(tasc1)
tasc2 = abs(tasc2)

#calculate the I similarity statistic
I = Istat(tasc1,tasc2)
print(I) #high niche overlap

#using a more variable map
tasc2 = tasc + rnorm(n = 2500, mean = 25, sd = 15);tasc2 = abs(tasc2)
I = Istat(tasc1,tasc2)
print(I) #lower niche overlap



