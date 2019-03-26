library(mvord)
library(MASS)

mult.obs <- 4
sigma <- matrix(c(1,0.1,0.1,0.1,0.1,1,0.9,0.8,0.1,0.9,1, 0.7,0.1,0.8,0.7,1),ncol=4, nrow = 4)
betas <- list(c(-0.2,0,0.2),
              c(0.8,-0.5,0),
              c(0.4,-0.5,0.8),
              c(1.2,-0.8,0))
thresholds <- list(c(0), c(-1,0,1),c(-2,0,2),c(-1.5, -0.5, 0, 0.5, 1.5))
nobs <- 100
seed <- 2017

sim <- function(obs, betas, thresholds,
                link = "probit",
                sigma, X = NULL,
                seed = NULL, intercept = FALSE,
                var.random = 0,
                var.error = 1,
                var.pred = 1) {
  ## default is CMOP (with no random effects)
  suppressWarnings(RNGversion("3.5.0"))
  if (!is.null(seed)) set.seed(seed)
  mult.obs <- length(betas)
  num.covariates <- ifelse(intercept,  length(betas[[1]]) - 1, length(betas[[1]]))
  if (link == "probit")
    errors <-  mvrnorm(n = obs, mu = rep(0, mult.obs), Sigma = sigma)
  if (link == "logit"){
    #library(copula)
    sigma_cor <- cov2cor(sigma)
    sd_sigma <-  sqrt(diag(sigma))
    myCop <- tCopula(sigma_cor[lower.tri(sigma_cor)],
                     dim = mult.obs, df = 8,
                     df.fixed = TRUE,
                     dispstr = "un")
    ui <- rCopula(obs, myCop)
    errors <-  t(t(qlogis(ui)) * sd_sigma)
  }
  random.effects <- rnorm(obs, 0, sqrt(var.random))
  if (is.null(X)) {
    pred <- cbind(if (intercept) {rep(1, obs)},
                  sapply(1:num.covariates, function(i) rnorm(obs, 0, var.pred)))
  } else {
    pred <- X
  }
  y <- sapply(1:mult.obs, function(j) pred %*% betas[[j]] +
                random.effects + errors[, j], simplify = "array")
  y.ord <- sapply(1:mult.obs, function(j) cut(y[, , j], c(min(y[, , j]) - 1, c(thresholds[[j]]), max(y[, , j]) + 1),
                                              labels = FALSE), simplify = "array")
  predictors.fixed <- lapply(1:mult.obs, function(j) pred)
  list("y.ord" = y.ord, # ordinal outcomes
       "y.tilde" = y, # underlying latent variables
       "predictors.fixed" = predictors.fixed,
       "predictors.random" = random.effects)
}

sim.CMOR <- sim(obs = nobs, betas = betas, thresholds = thresholds,
                sigma = sigma, intercept = FALSE, seed = seed,
                var.error = 1, var.pred = 1, var.random = 0)
y <- as.data.frame(sim.CMOR$y.ord)
for(i in 1:4){
  y[,i] <- factor(y[,i], levels = sort(unique(y[,i])), ordered = TRUE)
}
x <- sim.CMOR$predictors.fixed[[1]]

sec <- as.factor(sample(3,100, replace = TRUE))



yy <- c(as.matrix(y))

xx <- do.call("rbind", lapply(sim.CMOR$predictors.fixed, function(i) cbind.data.frame(i,sec)))
colnames(xx) <- paste0("X", 1:ncol(xx))
df <- data.frame(yy, xx, firm = rep(1:nobs, mult.obs), rater = rep(1:mult.obs, each=nobs))
#df <- df[- sample(1:300, 20), ]
#head(df)
data <-df

formula <- yy ~ 0 + X1 + X2 + X3 + X4


#Model needs data
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"))
, silent = TRUE), "condition")))
#Model needs formula
mvord:::check(!is.null(attr(try(
  mvord:::mvord(data = data,
        link = mvprobit(),
        solver = "newuoa",
        index = c("firm", "rater"))
, silent = TRUE), "condition")))
# #Model needs link
# mvord:::check(!is.null(attr(try(
#   mvord:::mvord(formula = formula, data = data,
#         #link = mvprobit(),
#         solver = "newuoa",
#         index = c("firm", "rater"))
# , silent = TRUE), "condition")))

#only one response needed
formula <- yy + X4 ~ 0 + X1 + X2 + X3 + X4
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"))
, silent = TRUE), "condition")))

formula <- cbind(yy + X4) ~ 0 + X1 + X2 + X3 + X4
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"))
, silent = TRUE), "condition")))

formula <- yy ~ 0 + X1 + X2 + X3 + X4
#duplicated observation(s) for one index
data2 <- data
data2$firm[2] <- 1
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data2,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"))
, silent = TRUE), "condition")))

#levels of response do not match with y.levels
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        response.levels = list(c(1),c(3,4)))
, silent = TRUE), "condition")))

#Weights need to be constant across repeated measurements
#? weights and covariate?
formula <- yy ~ 0 + X1 + X2 + X3
data3 <- data
data3$X4[101] <- 2
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data3,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        weights = "X4")
, silent = TRUE), "condition")))

#Weights must be non-negative
data3 <- data
data3$X4 <- rep(sample(-1:3,100, replace = TRUE),4)
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data3,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        weights = "X4")
, silent = TRUE), "condition")))


#set.error.structure
formula <- yy ~ 0 + X1 + X2 + X3 + X4


data4 <- data
data4$X5 <- data4$X4
#only one factor is allowed in cov_general and cor_general
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula,
                    data = data4,
        link = mvprobit(),
        #solver = "newuoa",
        error.structure = cor_general(~ X4 + X5),
        index = c("firm", "rater"))
, silent = TRUE), "condition")))

mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula,
                    data = data,
        link = mvprobit(),
        #solver = "newuoa",
        error.structure = cor_general(~X1),
        index = c("firm", "rater"))
, silent = TRUE), "condition")))

mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula,
                    data = data,
        link = mvprobit(),
        #solver = "newuoa",
        error.structure = cov_general(~X1 + X2),
        index = c("firm", "rater"))
, silent = TRUE), "condition")))

mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula,
                    data = data,
        link = mvprobit(),
        #solver = "newuoa",
        error.structure = cor_general(~X1 *X3),
        index = c("firm", "rater"))
, silent = TRUE), "condition")))





#Use PL.lag only with cor_ar1 error.structure
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        error.structure = cor_general(~1),
        PL.lag = 1)
, silent = TRUE), "condition")))

mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        error.structure = cov_general(~1),
        PL.lag = 1)
, silent = TRUE), "condition")))

mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        error.structure = cor_equi(~1),
        PL.lag = 1)
, silent = TRUE), "condition")))
#PL.lag must be greater than 0
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        error.structure = cor_ar1(~1),
        PL.lag = -1)
, silent = TRUE), "condition")))

# #Responses need to be ordered factors
# data4 <- data
# data4$yy <- as.numeric(data4$yy)
# mvord(formula, data4,
#         link = mvprobit(),
#         solver = "newuoa",
#         index = c("firm", "rater"))



#set.threshold
formula <- yy ~ 1 + X1 + X2 + X3 + X4
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        error.structure = cov_general(~1),
        threshold.values = list(c(0), c(-1,NA,NA),c(-2,NA,NA),c(-1.5, NA, NA, NA, NA)))
, silent = TRUE), "condition")))
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        error.structure = cov_general(~1),
        threshold.values = list(c(NA), c(NA,NA,NA),c(NA,NA,NA),c(NA, NA, NA, NA, NA)))
, silent = TRUE), "condition")))


formula <- yy ~ 1 + X1 + X2 + X3 + X4
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        error.structure = cov_general(~1),
        threshold.values = list(c(0), c(-1,NA,NA),c(-2,-1,NA),c(-1.5, NA, NA, NA, NA)))
, silent = TRUE), "condition")))

mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        error.structure = cov_general(~1),
        threshold.values = list(c(0), c(-1,NA,NA),c(NA,NA,NA),c(-1.5, NA, NA, NA, NA)))
, silent = TRUE), "condition")))

#checkArgs
formula <- yy ~ 0 + X1 + X2 + X3 + X4
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        threshold.constraints = c(1,1))
, silent = TRUE), "condition")))
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        threshold.constraints = c(1,1,1,1,1,1))
, silent = TRUE), "condition")))
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        threshold.constraints = 1:6)
, silent = TRUE), "condition")))
#dimensions of threshold.values and number of thresholds do not match
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        threshold.values = list(c(-1,NA,NA),c(NA,NA,NA),c(-1.5, NA, NA, NA, NA)))
, silent = TRUE), "condition")))

mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
                link = mvprobit(),
                #solver = "newuoa",
                index = c("firm", "rater"),
                threshold.values = list(c(0,1),c(-1,NA,NA),c(NA,NA,NA),c(-1.5, NA, NA, NA, NA)))
, silent = TRUE), "condition")))
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        threshold.values = list(c(0),c(-1,NA,NA,NA),c(NA,NA,NA),c(-1.5, NA, NA, NA, NA)))
, silent = TRUE), "condition")))
#If constraints are set on thresholds (by threshold.constraints), threshold.values must be specified accordingly for these outcome dimensions.
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        threshold.constraints = c(1,2,2,3),
        threshold.values = list(c(0),c(-1,NA,NA),c(-2,NA,NA),c(-1.5, NA, NA, NA, NA)))
, silent = TRUE), "condition")))
#row dimension of coef.constraints and outcome dimension do not match (?factor)
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        coef.constraints = matrix(1,ncol = 4, nrow = 3))
, silent = TRUE), "condition")))
mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
        link = mvprobit(),
        #solver = "newuoa",
        index = c("firm", "rater"),
        coef.constraints = matrix(1,ncol = 4, nrow = 5))
, silent = TRUE), "condition")))



mvord:::check(!is.null(attr(try(
  mvord:::mvord(formula = formula, data = data,
                    link = mvprobit(),
                    #solver = "newuoa",
                    index = c("firm", "rater"),
                    coef.constraints = matrix(1,ncol = 3, nrow = 5))
  , silent = TRUE), "condition")))
