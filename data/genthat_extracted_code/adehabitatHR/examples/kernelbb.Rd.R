library(adehabitatHR)


### Name: kernelbb
### Title: Estimation of Kernel Brownian Bridge Home-Range
### Aliases: kernelbb print.liker liker
### Keywords: spatial

### ** Examples


## Not run: 
##D 
##D #########################################################
##D #########################################################
##D #########################################################
##D ###
##D ###        Example of a typical case study
##D ###       with the brownian bridge approach
##D ###
##D 
##D ## Load the data
##D data(puechcirc)
##D x <- puechcirc[1]
##D 
##D ## Field studies have shown that the mean standard deviation (relocations
##D ## as a sample of the actual position of the animal) is equal to 58
##D ## meters on these data (Maillard, 1996, p. 63). Therefore
##D sig2 <- 58
##D 
##D ## Find the maximum likelihood estimation of the parameter sig1
##D ## First, try to find it between 10 and 100.
##D liker(x, sig2 = 58, rangesig1 = c(10, 100))
##D 
##D ## Wow! we expected a too large standard deviation! Try again between
##D ## 1 and 10:
##D liker(x, sig2 = 58, rangesig1 = c(1, 10))
##D 
##D ## So that sig1 = 6.23
##D 
##D ## Now, estimate the brownian bridge
##D tata <- kernelbb(x, sig1 = 6.23, sig2 = 58, grid = 100)
##D image(tata)
##D 
##D 
##D ## OK, now look at the home range
##D image(tata)
##D plot(getverticeshr(tata, 95), add=TRUE, lwd=2)
##D 
##D 
##D 
##D 
##D 
##D #########################################################
##D #########################################################
##D #########################################################
##D ###
##D ###      Comparison of the brownian bridge approach
##D ###            with the classical approach
##D ###
##D 
##D 
##D ## Take an illustrative example: we simulate a trajectory
##D set.seed(2098)
##D pts1 <- data.frame(x = rnorm(25, mean = 4.5, sd = 0.05),
##D                    y = rnorm(25, mean = 4.5, sd = 0.05))
##D pts1b <- data.frame(x = rnorm(25, mean = 4.5, sd = 0.05),
##D                     y = rnorm(25, mean = 4.5, sd = 0.05))
##D pts2 <- data.frame(x = rnorm(25, mean = 4, sd = 0.05),
##D                    y = rnorm(25, mean = 4, sd = 0.05))
##D pts3 <- data.frame(x = rnorm(25, mean = 5, sd = 0.05),
##D                    y = rnorm(25, mean = 4, sd = 0.05))
##D pts3b <- data.frame(x = rnorm(25, mean = 5, sd = 0.05),
##D                     y = rnorm(25, mean = 4, sd = 0.05))
##D pts2b <- data.frame(x = rnorm(25, mean = 4, sd = 0.05),
##D                     y = rnorm(25, mean = 4, sd = 0.05))
##D pts <- do.call("rbind", lapply(1:25, function(i) {
##D           rbind(pts1[i,], pts1b[i,], pts2[i,], pts3[i,],
##D                 pts3b[i,], pts2b[i,])
##D }))
##D dat <- 1:150
##D class(dat) <- c("POSIXct","POSIXt")
##D x <- as.ltraj(pts, date=dat, id = rep("A", 150))
##D 
##D ## See the trajectory:
##D plot(x)
##D 
##D 
##D ## Now, we suppose that there is a precision of 0.05
##D ## on the relocations
##D sig2 <- 0.05
##D ## and that sig1=0.1
##D sig1 <- 0.1
##D 
##D ## Now fits the brownian bridge home range
##D (kbb <- kernelbb(x, sig1 = sig1,
##D                  sig2 = sig2))
##D 
##D 
##D ## Now fits the classical kernel home range
##D coordinates(pts) <- c("x","y")
##D (kud <- kernelUD(pts))
##D 
##D 
##D ###### The results
##D 
##D opar <- par(mfrow=c(2,2), mar=c(0.1,0.1,2,0.1))
##D plot(pts, pch=16)
##D title(main="The relocation pattern")
##D box()
##D plot(x, axes=FALSE, main="The trajectory")
##D box()
##D image(kud)
##D title(main="Classical kernel home range")
##D plot(getverticeshr(kud, 95), add=TRUE)
##D box()
##D image(kbb)
##D title(main="Brownian bridge kernel home range")
##D plot(getverticeshr(kbb, 95), add=TRUE)
##D box()
##D par(opar)
##D 
##D 
##D 
##D ###############################################
##D ###############################################
##D ###############################################
##D ###
##D ###         Image of a brownian bridge.
##D ###          Fit with two relocations
##D ###               
##D 
##D 
##D xx <- c(0,1)
##D yy <- c(0,1)
##D date <- c(0,1)
##D class(date) <- c("POSIXt", "POSIXct")
##D tr <- as.ltraj(data.frame(x = xx,y = yy), date, id="a")
##D 
##D ## Use of different smoothing parameters
##D sig1 <- c(0.05, 0.1, 0.2, 0.4, 0.6)
##D sig2 <- c(0.05, 0.1, 0.2, 0.5, 0.7)
##D 
##D y <- list()
##D for (i in 1:5) {
##D   for (j in 1:5) {
##D      k <- paste("s1=", sig1[i], ", s2=", sig2[j], sep = "")
##D      y[[k]]<-kernelbb(tr, sig1[i], sig2[j])
##D    }
##D  }
##D 
##D ## Displays the results
##D opar <- par(mar = c(0,0,2,0), mfrow = c(5,5))
##D foo <- function(x)
##D    {
##D      image(y[[x]])
##D      title(main = names(y)[x])
##D      points(tr[[1]][,c("x","y")], pch = 16)
##D    }
##D lapply(1:length(y), foo)
##D 
##D par(opar)
##D 
##D 
## End(Not run)



