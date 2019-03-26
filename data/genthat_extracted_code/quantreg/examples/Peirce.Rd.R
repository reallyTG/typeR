library(quantreg)


### Name: Peirce
### Title: C.S. Peirce's Auditory Response Data
### Aliases: Peirce
### Keywords: datasets

### ** Examples


# Make table like Wilson and Hilferty

data("Peirce")
set.seed(10) #Dither the counts
tab <- matrix(0,24,11)
for(i in 1:24){
	y <- rep(Peirce[[i]]$x, Peirce[[i]]$y) + runif(sum(Peirce[[i]]$y), -.5, .5)
	f1 <- summary(rq(y~1),se="iid")$coef[1:2]
	n <- length(y)
	f0 <- 1/(2 * sum(abs(y-f1[1])/n)) #Laplace proposal
	f0 <- (1/(2 * f0))/ sqrt(n)
	f2 <- summary(lm(y~1))$coef[1:2]
	outm <- sum(y < (f1[1] - 3.1 * sqrt(n) * f2[2]))
	outp <- sum(y > (f1[1] + 3.1 * sqrt(n) * f2[2]))
	outt <- outm + outp
	inm <- y > (f1[1] - 0.25 * sqrt(n) * f2[2])
	inp <- y < (f1[1] + 0.25 * sqrt(n) * f2[2])
	int <- sum(inm * inp)
	Eint <- round(n * (pnorm(.25) - pnorm(-.25)))
	excess <- round(100*(int - Eint)/Eint)
	tab[i,] <- c(f1, f0, f2, outm, outp, outt,int,Eint,excess)
	cnames <- c("med","sdmed1","sdmed0","mean","sdmean","below","above","outliers",
		"inliers","Einliers","ExcessIns")
	dimnames(tab) <- list(paste("Day",1:24),cnames)
	}



