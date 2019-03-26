library(nlsem)


### Name: em
### Title: Maximum likelihood estimation of structural equation mixture
###   models
### Aliases: em

### ** Examples


###### Example for SEMM ######
# load data
data("PoliticalDemocracy", package = "lavaan")
dat <- as.matrix(PoliticalDemocracy[ ,c(9:11,1:8)])

# specify model of class SEMM
model <- specify_sem(num.x = 3, num.y = 8, num.xi = 1, num.eta = 2, 
  xi = "x1-x3", eta = "y1-y4,y5-y8", rel.lat = "eta1~xi1,eta2~xi1,eta2~eta1",
  num.classes = 2, constraints = "direct1")

# fit model
set.seed(911)
start <- runif(count_free_parameters(model))
## Not run: 
##D res <- em(model, dat, start, convergence = 0.1, max.iter = 200)
##D summary(res)
##D plot(res)
## End(Not run)

###### Example for LMS ######
model <- specify_sem(num.x = 11, num.y = 4, num.xi = 2, num.eta = 1,
  xi = "x1-x5,x6-x11", eta = "y1-y4", interaction = "eta1~xi1:xi2")

data("jordan")

set.seed(110)
start <- runif(count_free_parameters(model))
## Not run: 
##D res <- em(model, jordan, start, convergence=1, verbose=TRUE)
##D summary(res)
##D plot(res)
## End(Not run)

###### Example using lavaan syntax ######
lav.model <- '
  eta =~ y1 + y2 + y3 + y4
  xi1 =~ x1 + x2 + x3 + x4 + x5
  xi2 =~ x6 + x7 + x8 + x9 + x10 + x11

  eta ~ xi1 + xi2 + xi1:xi2 + xi1:xi1'

model <- lav2nlsem(lav.model)

data("jordan")

set.seed(1118)
start <- runif(count_free_parameters(model))
## Not run: 
##D res <- em(model, jordan, start, convergence=1, verbose=TRUE)
## End(Not run)



