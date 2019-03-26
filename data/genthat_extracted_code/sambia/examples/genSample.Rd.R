library(sambia)


### Name: genSample
### Title: Generate synthetic observations using inverse-probability
###   weights
### Aliases: genSample

### ** Examples

## simulate data for a population
require(pROC)

set.seed(1342334)
N = 100000
x1 <- rnorm(N, mean=0, sd=1) 
x2 <- rt(N, df=25)
x3 <- x1 + rnorm(N, mean=0, sd=.6)
x4 <- x2 + rnorm(N, mean=0, sd=1.3)
x5 <- rbinom(N, 1, prob=.6)
x6 <- rnorm(N, 0, sd = 1) # noise not known as variable
x7 <- x1*x5 # interaction
x <- cbind(x1, x2, x3, x4, x5, x6, x7)

## stratum variable (covariate)
xs <- c(rep(1,0.1*N), rep(0,(1-0.1)*N))

## effects
beta <- c(-1, 0.2, 0.4, 0.4, 0.5, 0.5, 0.6)
beta0 <- -2

## generate binary outcome
linpred.slopes <-  log(0.5)*xs + c(x %*% beta)
eta <-  beta0 + linpred.slopes

p <- 1/(1+exp(-eta)) # this is the probability P(Y=1|X), we want the binary outcome however:
y<-rbinom(n=N, size=1, prob=p) #

population <- data.frame(y,xs,x)

#### draw "given" data set 
sel.prob <- rep(1,N)
sel.prob[population$xs == 1] <- 9
sel.prob[population$y == 1] <- 8
sel.prob[population$y == 1 & population$xs == 1] <- 150
ind <- sample(1:N, 200, prob = sel.prob)

data = population[ind, ]

## calculate weights from original numbers for xs and y
w.matrix <- table(population$y, population$xs)/table(data$y, data$xs)
w <- rep(NA, nrow(data))
w[data$y==0 & data$xs ==0] <- w.matrix[1,1]
w[data$y==1 & data$xs ==0] <- w.matrix[2,1]
w[data$y==0 & data$xs ==1] <- w.matrix[1,2]
w[data$y==1 & data$xs ==1] <- w.matrix[2,2]
## parametric IP bootstrap sample
sample1 <- sambia::genSample(data=data, strata.variables = c('y', 'xs'),
                          weights = w, type='parIP')
## stochastic IP oversampling; treating 'y' and 'xs' as usual input variable
## but using strata info unambiguously defined by the weights w                        
sample2 <- sambia::genSample(data=data,
                            weights = w, type='stochIP', stratum= round(w))



