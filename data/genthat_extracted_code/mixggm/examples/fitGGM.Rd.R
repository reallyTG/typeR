library(mixggm)


### Name: fitGGM
### Title: Fit a Gaussian graphical model
### Aliases: fitGGM print.fitGGM

### ** Examples


# Gaussian covariance graph model
data(mtcars)
x <- mtcars[,c(1,3:7)]
R <- cor(x)
#
# model where variables with correlation less than 0.5 are marginally independent
graph <- ( abs(R) < 0.5 )*1
diag(graph) <- 0
fit1 <- fitGGM(data = x, graph = graph)
plot(fit1)


# Gaussian concentration graph model
data(swiss)
#
# fit a conditional independence model:
V <- ncol(swiss)
graph <- matrix( c(0,1,0,1,1,1,
                   1,0,1,1,0,0,
                   0,1,0,1,1,0,
                   1,1,1,0,1,0,
                   1,0,1,1,0,0,
                   1,0,0,0,0,0), V,V, byrow = TRUE )
fit2 <- fitGGM(swiss, graph = graph, model = "concentration")
plot(fit2)


## Not run: 
##D 
##D data(marks, package = "ggm")
##D #
##D # the conditional independence model of Whittaker (1990), pag. 6
##D V <- ncol(marks)
##D graph <- matrix( c(0,1,1,0,0,
##D                    1,0,1,0,0,
##D                    1,1,0,1,1,
##D                    0,0,1,0,1,
##D                    0,0,1,1,0), V,V, byrow = TRUE )
##D fit3 <- fitGGM(marks, graph = graph, model = "concentration")
##D plot(fit3)
## End(Not run)




