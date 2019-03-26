library(fdakma)


### Name: kma.similarity
### Title: Similarity/dissimilarity index between two functions
### Aliases: kma.similarity
### Keywords: Similarity

### ** Examples

data(kma.data)

x.f <- kma.data$x # abscissas of f and f'
x.g <- kma.data$x # abscissas of g and g'

y0.f <- kma.data$y0[1,] # evaluations of f on the abscissa grid x.f
y1.f <- kma.data$y1[1,] # evaluations of f' on the abscissa grid x.f
y0.g <- kma.data$y0[3,] # evaluations of g on the abscissa grid x.g
y1.g <- kma.data$y1[3,] # evaluations of g' on the abscissa grid x.g


## Not run: 
##D   # Plot of the two functions f and g
##D   plot(t(x.g),t(y0.g), type='l', xlab='x', ylab='y',, col='red')
##D   points(t(x.f),t(y0.f), type='l')
##D   title ('f and g')
##D   legend('bottomleft', legend=c('f','g'), 
##D          col=c('black','red'), lty=c(1,1), cex = 0.5)
## End(Not run)

# Example: 'd0.pearson'
kma.similarity (x.f=x.f, y0.f=y0.f, x.g=x.g,  y0.g=y0.g, similarity.method='d0.pearson')

# Example: 'd0.L2'
kma.similarity (x.f=x.f, y0.f=y0.f, x.g=x.g,  y0.g=y0.g, similarity.method='d0.L2')

## Not run: 
##D   # Plot of the two function first derivatives f' and g'
##D   plot(t(x.g),t(y1.g), type='l', xlab='x', ylab='y', col='red')
##D   points(t(x.f),t(y1.f), type='l')
##D   title ("f' and  g'")
##D   legend('bottomleft', legend=c("f'","g'"), 
##D          col=c('black','red'), lty=c(1,1), cex = 0.5)
## End(Not run)

# Example: 'd1.pearson'
kma.similarity (x.f=x.f, y1.f=y1.f, x.g=x.g,  y1.g=y1.g, similarity.method='d1.pearson')

# Example: 'd1.L2'
kma.similarity (x.f=x.f, y1.f=y1.f, x.g=x.g,  y1.g=y1.g, similarity.method='d1.L2')




