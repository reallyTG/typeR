library(surveillance)


### Name: create.grid
### Title: Create a Matrix of Initial Values for 'algo.hhh.grid'
### Aliases: create.grid
### Keywords: misc

### ** Examples

# simulate data
set.seed(123)
disProgObj <- simHHH(control = list(coefs = list(alpha =-0.5, gamma = 0.4,
                     delta = 0.6)),length=300)$data

# consider the model specified in a control object for algo.hhh.grid
cntrl1 <- list(lambda=TRUE, neighbours=TRUE, 
               linear=TRUE, nseason=1)
cntrl2 <- list(lambda=TRUE, negbin="single")

# create a grid of initial values for respective parameters
grid1 <- create.grid(disProgObj, cntrl1, 
                     params = list(epidemic=c(0.1,0.9,3), 
                                   endemic=c(-1,1,3)))
grid2 <- create.grid(disProgObj, cntrl2, 
                     params = list(epidemic=c(0.1,0.9,5), 
                                   negbin=c(0.3,12,10)))




