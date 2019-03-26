library(FRK)


### Name: FRK
### Title: Construct SRE object, fit and predict
### Aliases: FRK SRE SRE.fit SRE.predict predict,SRE-method loglik
### Keywords: spatial

### ** Examples

library(sp)

### Generate process and data
n <- 100
sim_process <- data.frame(x = seq(0.005,0.995,length=n))
sim_process$y <- 0
sim_process$proc <- sin(sim_process$x*10) + 0.3*rnorm(n)

sim_data <- sim_process[sample(1:n,50),]
sim_data$z <- sim_data$proc + 0.1*rnorm(50)
sim_data$std <- 0.1
coordinates(sim_data) = ~x + y # change into an sp object
grid_BAUs <- auto_BAUs(manifold=real_line(),data=sim_data,
                       nonconvex_hull=FALSE,cellsize = c(0.01),type="grid")
grid_BAUs$fs = 1

### Set up SRE model
G <- auto_basis(manifold = real_line(),
                data=sim_data,
                nres = 2,
                regular = 6,
                type = "bisquare",
                subsamp = 20000)
f <- z ~ 1
S <- SRE(f,list(sim_data),G,
         grid_BAUs,
         est_error = FALSE)

### Fit with 5 EM iterations so as not to take too much time
S <- SRE.fit(S,n_EM = 5,tol = 0.01,print_lik=TRUE)

### Check fit info


### Predict over BAUs
grid_BAUs <- predict(S)

### Plot
## Not run: 
##D library(ggplot2)
##D X <- slot(grid_BAUs,"data")
##D X <- subset(X, x >= 0 & x <= 1)
##D  g1 <- LinePlotTheme() +
##D     geom_line(data=X,aes(x,y=mu)) +
##D     geom_errorbar(data=X,aes(x=x,ymax = mu + 2*sqrt(var), ymin= mu - 2*sqrt(var))) +
##D     geom_point(data = data.frame(sim_data),aes(x=x,y=z),size=3) +
##D     geom_line(data=sim_process,aes(x=x,y=proc),col="red")
##D  print(g1)
## End(Not run)



