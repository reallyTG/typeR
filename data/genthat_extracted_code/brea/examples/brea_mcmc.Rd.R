library(brea)


### Name: brea_mcmc
### Title: Bayesian Discrete Survival Inference
### Aliases: brea_mcmc
### Keywords: survival regression

### ** Examples


# leukemia remission times data from Table 1 of "Regression Models and
# Life-Tables" (Cox, 1972)

# times of event occurrence or right censoring:
time <- c(6,6,6,6,7,9,10,10,11,13,16,17,19,20,22,23,25,32,32,34,35,
          1,1,2,2,3,4,4,5,5,8,8,8,8,11,11,12,12,15,17,22,23)

# event/censoring indicator (1 for event occurrence, 0 for right censoring):
event <- c(0,1,1,1,1,0,0,1,0,1,1,0,0,0,1,1,0,0,0,0,0,
           1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

# treatment group indicator (1 for treatment, 2 for control):
treat <- c(rep(1,21),rep(2,21))

# total number of person-time observations among all subjects:
N <- sum(time)

# create and fill in person-time predictor and event variables:
x <- matrix(0,N,2)  # first column is time, second column is treatment
y <- numeric(N)
next_row <- 1  # next available row in the person-time variables
for (i in seq_along(time)) {
  rows <- next_row:(next_row + time[i] - 1)  # observations for subject i
  x[rows,1] <- seq_len(time[i])  # time is integers 1,2,...,time[i]
  x[rows,2] <- rep(treat[i],time[i])  # treatment group is constant
  y[rows] <- c(rep(0,time[i] - 1),event[i])  # outcome is 0's until event
  next_row <- next_row + time[i]  # increment the next available row pointer
}

# group the time-at-risk variable into 3-week intervals:
x[,1] <- cut(x[,1],seq(0,36,3),labels=FALSE)

# use GMRF prior for time, and categorical prior for treatment group:
priors <- list(list("gmrf",3,.01),list("cat",4))

# run the default of 100 burn-in iterations followed by 1,000 stored iterations:
fit <- brea_mcmc(x,y,priors)

# examine the structure of the returned posterior samples and acceptance counts:
str(fit)

# posterior samples of the treatment and control group parameters:
b_treatment <- fit$b_m_s[[2]][1,1,]
b_control <- fit$b_m_s[[2]][1,2,]

# posterior sample of treatment effect on linear predictor scale:
d <- b_control - b_treatment

# posterior mean, median, and sd of treatment effect on linear predictor scale:
mean(d); median(d); sd(d)

# posterior mean and median hazard ratios:
mean(exp(d)); median(exp(d))




