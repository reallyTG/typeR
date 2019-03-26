library(model4you)


### Name: binomial_glm_plot
### Title: Plot for a given logistic regression model (glm with binomial
###   family) with one binary covariate.
### Aliases: binomial_glm_plot

### ** Examples

set.seed(2017)

# number of observations
n <- 1000

# balanced binary treatment
# trt <- factor(rep(c("C", "A"), each = n/2),
#               levels = c("C", "A"))

# unbalanced binary treatment
trt <- factor(c(rep("C", n/4), rep("A", 3*n/4)),
              levels = c("C", "A"))

# some continuous variables
x1 <- rnorm(n)
x2 <- rnorm(n)

# linear predictor
lp <- -0.5 + 0.5*I(trt == "A") + 1*I(trt == "A")*I(x1 > 0)

# compute probability with inverse logit function
invlogit <- function(x) 1/(1 + exp(-x))
pr <- invlogit(lp)

# bernoulli response variable
y <- rbinom(n, 1, pr)
dat <- data.frame(y, trt, x1, x2)

# logistic regression model
mod <- glm(y ~ trt, data = dat, family = "binomial")
binomial_glm_plot(mod, plot_data = TRUE)

# logistic regression model tree
ltr <- pmtree(mod)
plot(ltr, terminal_panel = node_pmterminal(ltr,
                                           plotfun = binomial_glm_plot,
                                           confint = TRUE,
                                           plot_data = TRUE))




