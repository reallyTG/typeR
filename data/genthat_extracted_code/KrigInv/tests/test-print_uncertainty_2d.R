# Check example of print_uncertainty_2d

require("KrigInv")
require("testthat")

#print_uncertainty_2d

set.seed(9)
N <- 20 #number of observations
T <- c(20,40) #thresholds
testfun <- branin
lower <- c(0,0)
upper <- c(1,1)

#a 20 points initial design
design <- data.frame(matrix(c(
  0.221601397, 0.899299557,
  0.024233910, 0.020831235,
  0.207119019, 0.319571584,
  0.215733550, 0.112929404,
  0.443723588, 0.528322648,
  0.134076150, 0.912912638,
  0.390657790, 0.395104798,
  0.369315772, 0.381859073,
  0.668692957, 0.967499931,
  0.992109966, 0.848661385,
  0.117638954, 0.200608512,
  0.008471164, 0.972864807,
  0.883366815, 0.469133552,
  0.301054708, 0.900671975,
  0.492743506, 0.004426156,
  0.500629939, 0.878250739,
  0.402034473, 0.812698430,
  0.977082821, 0.941969747,
  0.358326011, 0.239630564,
  0.491660544, 0.755005470),
  ncol=2))

response <- testfun(design)

#km object with matern3_2 covariance
#params estimated by ML from the observations
model <- km(formula=~1, design = design,
            response = response,covtype="matern3_2",coef.trend = 154,coef.cov = c(0.67,1.37),coef.var = 27720)


result1 <- print_uncertainty_2d(model=model,T=T,main="probability of excursion",
                     type="pn",krigmeanplot=TRUE,vorobmean=TRUE)

precision <- 0.001
test_that(desc="integrated pn", expect_true( abs(result1 - 0.204245) < precision ) )
