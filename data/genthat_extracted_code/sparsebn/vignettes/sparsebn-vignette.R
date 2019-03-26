## ----message=FALSE, warning=FALSE----------------------------------------
library(sparsebn)
data(pathfinder)
data <- sparsebnData(pathfinder[["data"]], type = "continuous")
dags <- estimate.dag(data)
dags

## ------------------------------------------------------------------------
data(pathfinder)
dat <- sparsebnData(pathfinder$data, type = "continuous", ivn = NULL)

## ----message=FALSE, warning=FALSE----------------------------------------
dags <- estimate.dag(data = dat)
dags

## ----message=FALSE, warning=FALSE----------------------------------------
nn <- num.samples(dat) # number of samples in the dataset / equivalent to nrow(dat$data)
lambdas <- generate.lambdas(sqrt(nn), 0.05, lambdas.length = 50, scale = "linear")
dags <- estimate.dag(data = dat, 
                     lambdas = lambdas,
                     verbose = FALSE)
dags

## ---- fig.width = 6, fig.height = 6--------------------------------------
solution <- select(dags, edges = 195)
par(mfrow = c(1,2), oma = rep(0,4))
plotDAG(solution)
plot(solution,
     layout = igraph::layout_(to_igraph(solution$edges), igraph::in_circle()),
     vertex.label = NA,
     vertex.size = 5,
     vertex.label.color = gray(0),
     vertex.color = gray(0.9),
     edge.color = gray(0),
     edge.arrow.size = 0.45
)

## ---- fig.width = 6, fig.height = 6--------------------------------------
par(mfrow = c(1,2), oma = rep(0,4))
plotDAG(pathfinder$dag)
plot(pathfinder$dag,
     layout = igraph::layout_(to_igraph(pathfinder$dag), igraph::in_circle()),
     vertex.label = NA,
     vertex.size = 5,
     vertex.label.color = gray(0),
     vertex.color = gray(0.9),
     edge.color = gray(0),
     edge.arrow.size = 0.45
)

## ---- fig.width = 6, fig.height = 6--------------------------------------
select.idx <- select.parameter(dags, dat)
solution <- select(dags, index = select.idx) # same as dags[[select.idx]]

par(mfrow = c(1,2), oma = rep(0,4))
plotDAG(solution)
plot(solution,
     layout = igraph::layout_(to_igraph(solution$edges), igraph::in_circle()),
     vertex.label = NA,
     vertex.size = 5,
     vertex.label.color = gray(0),
     vertex.color = gray(0.9),
     edge.color = gray(0),
     edge.arrow.size = 0.45
)

## ------------------------------------------------------------------------
dags.fit <- estimate.parameters(dags, data = dat)

## ------------------------------------------------------------------------
unlist(lapply(dags.fit, function(x) x$coefs[1,2]))

## ------------------------------------------------------------------------
mean.vector <- rep(0, 3)
covariance.matrix <- rbind(c(3,2,1),
                           c(2,2,1),
                           c(1,1,1))

## ------------------------------------------------------------------------
gaussian.data <- mvtnorm::rmvnorm(n = 100, mean = mean.vector, sigma = covariance.matrix)
colnames(gaussian.data) <- c("X1", "X2", "X3")

## ------------------------------------------------------------------------
dat <- sparsebnData(gaussian.data, type = "continuous")
dags <- estimate.dag(data = dat, 
                         lambdas.length = 20, 
                         edge.threshold = 10, 
                         verbose = FALSE)
dags

## ------------------------------------------------------------------------
dags[[3]]
get.adjacency.matrix(dags[[3]])

## ---- warning=FALSE, message=FALSE---------------------------------------
cov.out <- estimate.covariance(data = dat)

## ------------------------------------------------------------------------
class(cov.out)

## ------------------------------------------------------------------------
cov.out[[3]]

## ---- warning=FALSE, message=FALSE---------------------------------------
gaussian.data <- mvtnorm::rmvnorm(n = 1000, mean = mean.vector, sigma = covariance.matrix)
dat <- sparsebnData(gaussian.data, type = "continuous")
cov.out <- estimate.covariance(data = dat)
cov.out[[3]]

## ------------------------------------------------------------------------
data(pathfinder)
B <- as.matrix(get.adjacency.matrix(pathfinder$dag)) # pathfinder network as an adjacency matrix

## ------------------------------------------------------------------------
id <- diag(rep(1, num.nodes(pathfinder$dag)))   # 109x109 identity matrix
Omega <- id                                     # conditional variances
Sigma <- solve(t(id - B)) %*% Omega %*% solve(id - B)

## ------------------------------------------------------------------------
set.seed(123)
nsamples <- 1000
gaussian.data <- mvtnorm::rmvnorm(nsamples, sigma = Sigma)

## ------------------------------------------------------------------------
B[B!=0] <- runif(n = num.edges(pathfinder$dag), min = 0.5, max = 2)
Sigma <- solve(t(id - B)) %*% Omega %*% solve(id - B)
gaussian.data <- mvtnorm::rmvnorm(nsamples, sigma = Sigma)

