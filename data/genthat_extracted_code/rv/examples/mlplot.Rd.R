library(rv)


### Name: mlplot
### Title: Horizontal interval plot of components of a random vector
### Aliases: mlplot mlplot.default mlplot.rvsummary
### Keywords: classes

### ** Examples



## Not run: 
##D   # You can run this complete example by typing demo("mlplot")
##D 
##D   n.rows <- 4; n.cols <- 5; n <- (n.rows*n.cols)
##D   # Draw some fixed numbers
##D   mu.true <- rnorm(1:n.rows, mean=1:n.rows, sd=1)
##D   sigma.true <- 1
##D   theta <- rvmatrix(rvnorm(n=n.cols, mean=mu.true, sd=sigma.true), nrow=n.rows)
##D   #
##D   col.labels <- paste("Time", 1:n.cols, sep=":")
##D   row.labels <- paste("Unit", 1:n.rows, sep=":")
##D   dimnames(theta) <- list(row.labels, col.labels)
##D   #
##D   par(mfrow=c(2,2))
##D   mlplot(theta, main="theta")
##D   abline(v=0, lty="dotted")
##D   mlplot(t(theta), main="theta transposed")
##D   abline(v=0, lty="dotted")
##D   row.sd <- apply.rv(theta, 1, sd.rv)
##D   col.sd <- apply.rv(theta, 2, sd.rv)
##D   x.max <- max(rvquantile(c(row.sd, col.sd), 0.99))
##D   mlplot(row.sd, xlim=c(0, x.max), main="theta: within-row sd for each unit")
##D   abline(v=0)
##D   mlplot(col.sd, xlim=c(0, x.max), main="theta: between-row sd for each time point")
##D   abline(v=0)
## End(Not run)




