library(bcp)


### Name: bcp
### Title: Performs a Bayesian analysis of change point problems
### Aliases: bcp
### Keywords: datasets

### ** Examples


##### univariate sequential data #####
# an easy problem with 2 true change points
set.seed(5)
x <- c(rnorm(50), rnorm(50, 5, 1), rnorm(50))
bcp.1a <- bcp(x)
plot(bcp.1a, main="Univariate Change Point Example")
legacyplot(bcp.1a)

# a hard problem with 1 true change point
set.seed(5)
x <- rep(c(0,1), each=50)
y <- x + rnorm(50, sd=1)
bcp.1b <- bcp(y)
plot(bcp.1b, main="Univariate Change Point Example")

##### multivariate sequential data #####
# an easy problem in k=3 dimensions
set.seed(5)
x <- rnorm(6, sd=3)
y <- rbind(cbind(rnorm(50, x[1]), rnorm(50, x[2]), rnorm(50, x[3])),
           cbind(rnorm(50, x[4]), rnorm(50, x[5]), rnorm(50, x[6])))
bcp.2a <- bcp(y)
plot(bcp.2a, main="Multivariate (k=3) Change Point Example")
plot(bcp.2a, separated=TRUE, main="Multivariate (k=3) Change Point Example")

# a harder problem in k=5 dimensions
set.seed(5)
means1 <- rep(0, 5)
means2 <- rep(1, 5)
x <- rbind(matrix(rep(means1, each=50), nrow=50),
           matrix(rep(means2, each=50), nrow=50))
y <- x + rnorm(length(x), sd=1)
bcp.2b <- bcp(cbind(y))
plot(bcp.2b, main="Multivariate (k=5) Change Point Example")

##### linear models with sequential data #####
# 1 true change point at location 50; the predicting variable x is not related to location
x <- rnorm(100)
b <- rep(c(3,-3), each=50)
y <- b*x + rnorm(100)
bcp.3a <- bcp(y, x)
# in the two plots that follow, the location IDs are used as the plot characters
par(mfrow=c(1,2))
plot(y ~ x, type="n", main="Linear Regression: Raw Data")
text(x, y, as.character(1:100), col=(b/3)+2)
plot(y ~ x, type="n", main="Linear Regression: Posterior Means")
text(x, bcp.3a$posterior.mean[,1], as.character(1:100), col=(b/3)+2)
plot(bcp.3a, main="Linear Regression Change Point Example")

# 1 true change point at location 50; the predicting variable x is equal to location
x <- 1:100
b <- rep(c(3,-3), each=50)
y <- b*x + rnorm(100, sd=50)
bcp.3b <- bcp(y, x)
plot(bcp.3b, main="Linear Regression Change Point Example")

##### univariate data on a grid #####  
## Not run: 
##D set.seed(5)
##D adj <- makeAdjGrid(20)
##D z <- rep(c(0, 2), each=200)
##D y <- z + rnorm(400, sd=1)
##D out <- bcp(y, adj=adj, burnin=500, mcmc=500)
##D 
##D if (require("ggplot2")) {
##D   df <- data.frame(mean=z, data = y, post.means = out$posterior.mean[,1], 
##D                    post.probs = out$posterior.prob, 
##D                    i = rep(1:20, each=20), j = rep(1:20, times=20))
##D 
##D   # visualize the means
##D   g <- ggplot(df, aes(i,j)) + 
##D          geom_tile(aes(fill = mean), color='white') +
##D          scale_fill_gradientn(limits=range(y), colours=c('white', 'steelblue'))+
##D          ggtitle("True Means")
##D   print(g)
##D 
##D   # visualize the data
##D   g <- ggplot(df, aes(i,j)) + 
##D          geom_tile(aes(fill = data), color='white') +
##D          scale_fill_gradientn(limits=range(y), colours=c('white', 'steelblue'))+
##D          ggtitle("Observed Data")
##D   print(g)
##D 
##D   # visualize the posterior means/probs
##D   g <- ggplot(df, aes(i,j)) + 
##D          geom_tile(aes(fill = post.means), color='white') +
##D          scale_fill_gradientn(limits=range(y), colours=c('white', 'steelblue'))+
##D          ggtitle("Posterior Means")
##D   print(g)
##D 
##D   g <- ggplot(df, aes(i,j)) + 
##D          geom_tile(aes(fill = post.probs), color='white') +
##D          scale_fill_gradientn(limits=c(0, 1), colours=c('white', 'steelblue'))+
##D          ggtitle("Posterior Boundary Probabilities")
##D   print(g)
##D }
## End(Not run)

## Not run: 
##D ##### multivariate data on a grid #####
##D set.seed(5)
##D x <- rnorm(6, sd=3)
##D y <- rbind(cbind(rnorm(50, x[1]), rnorm(50, x[2]), rnorm(50, x[3])),
##D            cbind(rnorm(50, x[4]), rnorm(50, x[5]), rnorm(50, x[6])))
##D adj <- makeAdjGrid(10)
##D a <- bcp(y, adj=adj, p0=0.4, burnin=500, mcmc=500)
##D 
##D ##### linear models on a grid #####
##D set.seed(5)
##D x <- rnorm(100)
##D b <- rep(c(3,-3), each=50)
##D y <- b*x + rnorm(100)
##D adj <- makeAdjGrid(10)
##D a <- bcp(y,x,adj=adj, p0=0.4, burnin=500, mcmc=500)
##D 
##D ##### linear models on a grid using pseudo-APPs #####
##D x <- rnorm(100)
##D b <- rep(c(3,-3), each=50)
##D y <- b*x + rnorm(100)
##D adj <- makeAdjGrid(10)
##D a <- bcp(y,x,adj=adj, p0=0.4, burnin=500, mcmc=500, p1 = 0)
## End(Not run)

##### univariate data on a graph ##### 
## Not run: 
##D  
##D   demo(bcpgraph)
## End(Not run)

###### Real Data Examples ######
## Not run: 
##D # Coriell chromosome 11: univariate sequential data
##D demo(coriell)
##D 
##D # U.S. ex-post interest rate: univariate sequential data
##D demo(RealInt)
##D 
##D # Lombard: univariate sequential data (with and without linear models)
##D demo(Lombard)
##D 
##D # Quebec rivers: multivariate sequential data
##D demo(QuebecRivers)
##D 
##D # New Haven housing: linear models on a graph
##D demo(NewHaven)
## End(Not run) 




