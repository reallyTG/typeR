library(mlxR)


### Name: simulx
### Title: Simulation of mixed effects models and longitudinal data
### Aliases: simulx

### ** Examples

## Not run: 
##D myModel <- inlineModel("
##D [LONGITUDINAL]
##D input = {A, k, c, a}
##D EQUATION:
##D t0    = 0 
##D f_0   = A
##D ddt_f = -k*f/(c+f)
##D DEFINITION:
##D y = {distribution=normal, prediction=f, sd=a}
##D [INDIVIDUAL]
##D input = {k_pop, omega}
##D DEFINITION:
##D k = {distribution=lognormal, prediction=k_pop, sd=omega}
##D ")
##D f <- list(name='f', time=seq(0, 30, by=0.1))
##D y <- list(name='y', time=seq(0, 30, by=2))
##D res <- simulx(model     = 'model/home.txt', 
##D               parameter = c(A=100, k_pop=6, omega=0.3, c=10, a=2), 
##D               output    = list(f,y,"k"),
##D               group     = list(size=4, level='individual'))
##D 
##D plot(ggplotmlx() + geom_line(data=res$f, aes(x=time, y=f, colour=id)) +
##D      geom_point(data=res$y, aes(x=time, y=y, colour=id)))
##D print(res$parameter)
## End(Not run)




