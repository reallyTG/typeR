library(kofnGA)


### Name: kofnGA
### Title: Search for the best subset of size k from n choices.
### Aliases: kofnGA
### Keywords: design optimize

### ** Examples

#---Find the four smallest numbers in a random vector of 100 uniforms---
# Generate the numbers and sort them so the best solution is (1,2,3,4).
Numbers <- sort(runif(100))
Numbers[1:6]                                              #-View the smallest numbers.
ObjFun <- function(v, some_numbers) sum(some_numbers[v])  #-The objective function.
ObjFun(1:4, Numbers)                                      #-The global minimum.
out <- kofnGA(n = 100, k = 4, OF = ObjFun, ngen = 50, some_numbers = Numbers)  #-Run the GA.
summary(out)
plot(out)

## Not run: 
##D # Note: the following two examples take tens of seconds to run (on a 2018 laptop).
##D 
##D #---Harder: find the 50x50 principal submatrix of a 500x500 matrix s.t. determinant is max---
##D # Use eigenvalue decomposition and QR decomposition to make a matrix with known eigenvalues.
##D n <- 500                                         #-Dimension of the matrix.
##D k <- 50                                          #-Size of subset to sample.
##D eigenvalues <- seq(10, 1, length.out=n)          #-Choose the eigenvalues (all positive).
##D L <- diag(eigenvalues)
##D RandMat <- matrix(rnorm(n^2), nrow=n)
##D Q <- qr.Q(qr(RandMat))
##D M <- Q %*% L %*% t(Q)
##D M <- (M+t(M))/2                                  #-Enusre symmetry (fix round-off errors).
##D ObjFun <- function(v,Mat)  -(determinant(Mat[v,v],log=TRUE)$modulus)
##D out <- kofnGA(n=n, k=k, OF=ObjFun, Mat=M)
##D print(out)
##D summary(out)
##D plot(out)
##D 
##D #---For interest: run GA searches iteratively (use initpop argument to pass results)---
##D # Alternate running with mutation probability 0.05 and 0.005, 50 generations each time.
##D # Use the same problem as just above (need to run that first).
##D mutprob <- 0.05
##D result <- kofnGA(n=n, k=k, OF=ObjFun, ngen=50, mutprob=mutprob, Mat=M)  #-First run (random start)
##D allavg <- result$old$avg                       #-For holding population average OF values
##D allbest <- result$old$obj                      #-For holding population best OF values
##D for(i in 2:10) {
##D   if(mutprob==0.05) mutprob <- 0.005 else mutprob <- 0.05
##D   result <- kofnGA(n=n, k=k, OF=ObjFun, ngen=50, mutprob=mutprob, initpop=result$pop, Mat=M)
##D   allavg <- c(allavg, result$old$avg[2:51])
##D   allbest <- c(allbest, result$old$obj[2:51])
##D }
##D plot(0:500, allavg, type="l", col="blue", ylim=c(min(allbest), max(allavg)))
##D lines(0:500, allbest, col="red")
##D legend("topright", legend=c("Pop average", "Pop best"), col=c("blue", "red"), bty="n",
##D        lty=1, cex=0.8)
##D summary(result)
## End(Not run)




