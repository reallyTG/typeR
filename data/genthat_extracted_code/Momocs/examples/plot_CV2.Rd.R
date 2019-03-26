library(Momocs)


### Name: plot_CV2
### Title: Plots a cross-correlation table
### Aliases: plot_CV2 plot_CV2.LDA plot_CV2.table

### ** Examples

# Below various table that you can try. We will use the last one for the examples.
## Not run: 
##D #pure random
##D a <- sample(rep(letters[1:4], each=10))
##D b <- sample(rep(letters[1:4], each=10))
##D tab <- table(a, b)
##D 
##D # veryhuge + some structure
##D a <- sample(rep(letters[1:10], each=10))
##D b <- sample(rep(letters[1:10], each=10))
##D tab <- table(a, b)
##D diag(tab) <- round(runif(10, 10, 20))
##D 
##D tab <- matrix(c(8, 3, 1, 0, 0,
##D                 2, 7, 1, 2, 3,
##D                 3, 5, 9, 1, 1,
##D                 1, 1, 2, 7, 1,
##D                 0, 9, 1, 4, 5), 5, 5, byrow=TRUE)
##D tab <- as.table(tab)
## End(Not run)
# good prediction
tab <- matrix(c(8, 1, 1, 0, 0,
               1, 7, 1, 0, 0,
                1, 2, 9, 1, 0,
                1, 1, 1, 7, 1,
                0, 0, 0, 1, 8), 5, 5, byrow=TRUE)
tab <- as.table(tab)


plot_CV2(tab)
plot_CV2(tab, arrows) # if you prefer arrows
plot_CV2(tab, lwd=FALSE, lwd0=1, palette=col_india) # if you like india but not lwds
plot_CV2(tab, col=FALSE, col0='pink') # only lwd
plot_CV2(tab, col=FALSE, lwd0=10, cex.names=2) # if you're getting old
plot_CV2(tab, col=FALSE, lwd=FALSE) # pretty but useless
plot_CV2(tab, col.breaks=2) # if you think it's either good or bad
plot_CV2(tab, pch=NA) # if you do not like dots
plot_CV2(tab, gap.dots=0) # if you want to 'fill the gap'
plot_CV2(tab, gap.dots=1) # or not

#trilo examples
trilo.f <- efourier(trilo, 8)
trilo.l <- LDA(PCA(trilo.f), 'onto')
trilo.l
plot_CV2(trilo.l)

# olea example
op <- opoly(olea, 5)
opl <- LDA(PCA(op), 'var')
plot_CV2(opl)



