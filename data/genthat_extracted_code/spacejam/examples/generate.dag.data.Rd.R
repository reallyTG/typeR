library(spacejam)


### Name: generate.dag.data
### Title: Generate nonlinear data from DAGs
### Aliases: generate.dag.data rdag moralize

### ** Examples

#########Create graph and distribution used in Figure 2 of Voorman, Shojaie and Witten (2013):
p <- 100 #variables
n <- 50 #observations

#Generate Graph
set.seed(20)
g <- rdag(p,80)
mylayout <- layout.fruchterman.reingold(g)

par(mfrow=c(1,2))
plot(g, layout = mylayout, edge.color = "gray50", 
        vertex.color = "red", vertex.size = 3, vertex.label = NA, 
        edge.arrow.size = 0.4)
plot(moralize(g), layout = mylayout, edge.color = "gray50", 
        vertex.color = "red", vertex.size = 3, vertex.label = NA, 
        edge.arrow.size = 0.4)

#create a distribution on the DAG using cubic polynomials with random normal coefficients 
#with standard deviations of 1, 0.5 and 0.5, (i.e. giving more weight to linear association than quadratic or cubic)
data <- generate.dag.data(g,n,basesd=c(1,0.5,0.5))
X <- data$X

#Fit conditional independence graph at one lambda 
fit1 <- SJ(X, lambda = 0.6)

###For additional replications using the same DAG distribution use e.g.
data <- generate.dag.data(g,n,funclist = data$funclist)




