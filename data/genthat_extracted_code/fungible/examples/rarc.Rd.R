library(fungible)


### Name: rarc
### Title: Rotate Points on the Surface on an N-Dimensional Ellipsoid
### Aliases: rarc
### Keywords: datagen

### ** Examples


## Example
## GRE/GPA Data
##-------------------##
R <- Rxx <- matrix(c(1.00, .56, .77,
                      .56, 1.00, .73,
                      .77, .73, 1.00), 3, 3)
                  
## GPA validity correlations                 
rxy <- c(.39, .34, .38)
b <- solve(Rxx) %*% rxy
 
Rsq <- t(b) %*% Rxx %*% b
N <- 200       
                   
b <- rarc(Rxx = R, Rsq, b1 = 1, b2 = 3, Npoints = N) 
 
## compute validity vectors
r <- Rxx %*% b
N <- N + 1
Rsq.r <- Rsq.unit <- rep(0, N)

for(i in 1:N){
## eval performance of unit weights
  Rsq.unit[i] <- (t(sign(r[,i])) %*% r[,i])^2 /
 		           (t(sign(r[,i])) %*% R %*% sign(r[,i]))
 		           
## eval performance of correlation weights               
  Rsq.r[i] <- (t(r[,i]) %*% r[,i])^2 /(t(r[,i]) %*% R %*% r[,i])	
}
 
cat("\nAverage relative performance of unit weights across elliptical arc:",
 	    round(mean(Rsq.unit)/Rsq,3) )     
cat("\n\nAverage relative performance of r weights across elliptical arc:",
 	    round(mean(Rsq.r)/Rsq,3) ) 
 

plot(seq(0, 90, length = N), Rsq.r, typ = "l", 
          ylim = c(0, .20),
          xlim = c(0, 95),
          lwd = 3,
          ylab = expression(R^2),
          xlab = expression(paste("Degrees from ",b[1]," in the direction of ",b[2])),
          cex.lab = 1.25, lab = c(10, 5, 5))
 points(seq(0, 90, length = N), Rsq.unit, 
          type = "l", 
          lty = 2, lwd = 3)
 legend(x = 0,y = .12,
        legend = c("r weights", "unit weights"), 
        lty = c(1, 2),
        lwd = c(4, 3),
        cex = 1.5)               



