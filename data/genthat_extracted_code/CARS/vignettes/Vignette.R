## ------------------------------------------------------------------------
# global parameters
m <- 5000; # number of tests
n_x <- 50; # number of samples for each location in x
n_y <- 60; # number of samples for each location in y
Nrep <- 50; # number of replications
alpha <- 0.05; # nominal level fdr

# next we generate the data matrices for x and y
# for illustrative purposes, we choose k=500
k <- 500;
mu_x_1 <- 5/sqrt(30); # signal strength for first 500 locations of x
mu_y_1 <- 3/sqrt(30); # signal strength for first 500 locations of y
mu_x_2 <- 4/sqrt(30); # signal strength for location 501 to 1000 of x
mu_y_2 <- 4/sqrt(30); # signal strength for location 501 to 1000 of y
sd_x <- 1; # standard deviation for all locations of x
sd_y <- sqrt(2); # standard deviation for all locations of y
theta <- rep(0,m); # the vector for true states of nature
theta[1:k] <- 1; # signal locations: first 500
# initialize the vector of false discovery proportions
FDP <- rep(0,Nrep);
# initialize the vector of missed discovery proportions
MDP <- rep(0,Nrep);

## ------------------------------------------------------------------------
library(CARS)
library(np)
for (i in 1:Nrep){
	# initialize matrices for x and y
	x <- matrix(rnorm(m*n_x,0,sd_x),m,n_x);
	y <- matrix(rnorm(m*n_y,0,sd_y),m,n_y);

	# fill in data matrices according to Setting 1 (k=500)
	x[c(1:k),] <- x[c(1:k),] + mu_x_1;
	y[c(1:k),] <- y[c(1:k),] + mu_y_1;
	x[c((k+1):(2*k)),] <- x[c((k+1):(2*k)),] + mu_x_2;
	y[c((k+1):(2*k)),] <- y[c((k+1):(2*k)),] + mu_y_2;

	# CARS procedure at level alpha
	decision <- CARS(x,y,alpha)$de;

	# false discovery proportion
	FDP[i] <- sum((1-theta)*decision)/sum(decision);

	# missed discovery proportion
	MDP[i] <- sum(theta*(1-decision))/sum(theta);
}

#finally we obtain the FDR and MDR levels by averaging the proportions over Nrep=50 replications

FDR <- mean(FDP);
MDR <- mean(MDP);
FDR;
MDR;

