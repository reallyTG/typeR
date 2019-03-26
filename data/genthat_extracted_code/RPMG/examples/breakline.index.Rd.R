library(RPMG)


### Name: breakline.index
### Title: Break a vector into segments
### Aliases: breakline.index
### Keywords: misc

### ** Examples


###   example with a vector of breaks
h  = 1:20
k = breakline.index(h, c(8, 14))

########  select with a matrix of start-ends
r1 = rbind(c(3,10), c(14, 18))
k = breakline.index(h, r1)

j1 = seq(from=3, to=17, by=3)
j2 = j1+5

##########  overlapping sequences
r1 = cbind(j1, j2)
k = breakline.index(h, r1)

######  example with coordinates

####  some data:
uu=list()
uu$x=c(136.66,136.34,136.07,136.07,135.62,135.03,134.98,
134.98,135.07,135.25,135.75,137.07,137.35,137.44,138.07,
138.07,137.80,137.75,137.25)
uu$y=c(39.878,39.749,39.490,39.296,39.200,39.135,38.909,
38.618,38.327,38.004,37.875,37.875,38.327,38.489,
38.812,39.006,39.232,39.587,39.943)

###  plot raw data
plot(uu$x, uu$y, type="l")

####  cutoff:
z1 = 39

h = 1:length(uu$x)

w1 = which( uu$y>z1)

g1 = list(x=uu$x[w1] , y=uu$y[w1] )

lines(g1, col='red')
############   notice the connecting line.
#########  how can we avoid this?

w2 = which(diff(w1)!=1)

k = breakline.index(w1, w2)

for(i in 1:length(k)) lines(uu$x[ k[[i]] ], uu$y[ k[[i]]  ], col='blue')
######  see, line is broken correctly






