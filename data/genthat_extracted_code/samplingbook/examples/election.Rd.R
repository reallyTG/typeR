library(samplingbook)


### Name: election
### Title: German Parliament Election Data
### Aliases: election
### Keywords: datasets

### ** Examples

data(election)
summary(election)

# 1) Draw a simple sample of size n=20
n <- 20
set.seed(67396)
index <- sample(1:nrow(election), size=n)
sample1 <- election[index,]
Smean(sample1$SPD_02, N=nrow(election))
# true mean
mean(election$SPD_02)

# 2) Estimate sample size to forecast proportion of SPD in election of 2005
sample.size.prop(e=0.01, P=mean(election$SPD_02), N=Inf)

# 3) Usage of previous knowledge by model based estimation
# draw sample of size n = 20
N <- nrow(election)
set.seed(67396)
sample <- election[sort(sample(1:N, size=20)),]
# secondary information SPD in 2002
X.mean <- mean(election$SPD_02)
# forecast proportion of SPD in election of 2005
mbes(SPD_05 ~ SPD_02, data=sample, aux=X.mean, N=N, method='all')
# true value
Y.mean <- mean(election$SPD_05)
Y.mean
# Use a second predictor variable
X.mean2 <- c(mean(election$SPD_02),mean(election$GREEN_02))
# forecast proportion of SPD in election of 2005 with two predictors
mbes(SPD_05 ~ SPD_02+GREEN_02, data=sample, aux=X.mean2, N=N, method= 'regr')



