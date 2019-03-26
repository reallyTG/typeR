library(mixggm)


### Name: plotting-functionalities
### Title: Plotting functionalities for Gaussian covariance and
###   concentration graph models and their mixture
### Aliases: plot.fitGGM plot.mixGGM

### ** Examples


# covariance graph
data(mtcars)
x <- mtcars[,c(1,3:7)]
R <- cor(x)
graph <- ( abs(R) < 0.5 )*1
diag(graph) <- 0
fit1 <- fitGGM(data = x, graph = graph)
plot(fit1)
plot(fit1, what = "adjacency")


# concentration graph
data(swiss)
V <- ncol(swiss)
graph <- matrix( c(0,1,0,1,1,1,
                   1,0,1,1,0,0,
                   0,1,0,1,1,0,
                   1,1,1,0,1,0,
                   1,0,1,1,0,0,
                   1,0,0,0,0,0), V,V, byrow = TRUE )
fit2 <- fitGGM(swiss, graph = graph, model = "concentration")
plot(fit2)
plot(fit2, layout = "random")
plot(fit2, what = "adjacency")


## Not run: 
##D 
##D # mixture of Gaussian concentration graph models
##D data(banknote, package = "mclust")
##D mod3 <- mixGGM(banknote[,-1], model = "concentration", K = 2)
##D plot(mod3, what = "graph")
##D plot(mod3, what = "adjacency")
##D plot(mod3, what = "classification")
##D plot(mod3, what = "classification", dimens = c(1,4,5))
##D plot(mod3, what = "common")
##D 
##D 
##D # mixture of Gaussian covariance graph models
##D data(wine, package = "gclus")
##D mod4 <- mixGGM(wine[,-1], model = "covariance", K = 3)
##D clb <- c("#999999", "#E69F00", "#56B4E9")                 # colorblind friendly palette
##D plot(mod4, what = "graph", colors = clb)
##D plot(mod4, what = "adjacency", colors = clb)
##D plot(mod4, what = "classification", colors = clb, dimens = c(1,7,8,12))
##D plot(mod4, what = "common")
##D 
## End(Not run)




