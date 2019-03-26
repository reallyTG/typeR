library(VGAM)


### Name: vglm.control
### Title: Control Function for vglm()
### Aliases: vglm.control
### Keywords: models regression

### ** Examples

# Example 1.
pneumo <- transform(pneumo, let = log(exposure.time))
vglm(cbind(normal, mild, severe) ~ let, multinomial, data = pneumo,
     crit = "coef", step = 0.5, trace = TRUE, epsil = 1e-8, maxit = 40)


# Example 2. The use of the xij argument (simple case).
ymat <- rdiric(n <- 1000, shape = rep(exp(2), len = 4))
mydat <- data.frame(x1 = runif(n), x2 = runif(n), x3 = runif(n),
                    x4 = runif(n),
                    z1 = runif(n), z2 = runif(n), z3 = runif(n),
                    z4 = runif(n))
mydat <- transform(mydat, X = x1, Z = z1)
mydat <- round(mydat, digits = 2)
fit2 <- vglm(ymat ~ X + Z,
             dirichlet(parallel = TRUE), data = mydat, trace = TRUE,
             xij = list(Z ~ z1 + z2 + z3 + z4,
                        X ~ x1 + x2 + x3 + x4),
             form2 = ~  Z + z1 + z2 + z3 + z4 +
                        X + x1 + x2 + x3 + x4)
head(model.matrix(fit2, type =  "lm"))  # LM model matrix
head(model.matrix(fit2, type = "vlm"))  # Big VLM model matrix
coef(fit2)
coef(fit2, matrix = TRUE)
max(abs(predict(fit2)-predict(fit2, new = mydat)))  # Predicts correctly
summary(fit2)
## Not run: 
##D # plotvgam(fit2, se = TRUE, xlab = "x1", which.term = 1)  # Bug!
##D # plotvgam(fit2, se = TRUE, xlab = "z1", which.term = 2)  # Bug!
##D plotvgam(fit2, xlab = "x1")  # Correct
##D plotvgam(fit2, xlab = "z1")  # Correct
## End(Not run)


# Example 3. The use of the xij argument (complex case).
set.seed(123)
coalminers <- transform(coalminers,
                        Age = (age - 42) / 5,
                        dum1 = round(runif(nrow(coalminers)), digits = 2),
                        dum2 = round(runif(nrow(coalminers)), digits = 2),
                        dum3 = round(runif(nrow(coalminers)), digits = 2),
                        dumm = round(runif(nrow(coalminers)), digits = 2))
BS <- function(x, ..., df = 3)
  sm.bs(c(x,...), df = df)[1:length(x),,drop = FALSE]
NS <- function(x, ..., df = 3)
  sm.ns(c(x,...), df = df)[1:length(x),,drop = FALSE]

# Equivalently...
BS <- function(x, ..., df = 3)
  head(sm.bs(c(x,...), df = df), length(x), drop = FALSE)
NS <- function(x, ..., df = 3)
  head(sm.ns(c(x,...), df = df), length(x), drop = FALSE)

fit3 <- vglm(cbind(nBnW,nBW,BnW,BW) ~ Age + NS(dum1, dum2),
             fam = binom2.or(exchangeable = TRUE, zero = 3),
             xij = list(NS(dum1, dum2) ~ NS(dum1, dum2) +
                                         NS(dum2, dum1) +
                                         fill(NS( dum1))),
             form2 = ~  NS(dum1, dum2) + NS(dum2, dum1) + fill(NS(dum1)) +
                        dum1 + dum2 + dum3 + Age + age + dumm,
             data = coalminers, trace = TRUE)
head(model.matrix(fit3, type = "lm"))   # LM model matrix
head(model.matrix(fit3, type = "vlm"))  # Big VLM model matrix
coef(fit3)
coef(fit3, matrix = TRUE)
## Not run: 
##D plotvgam(fit3, se = TRUE, lcol = "red", scol = "blue", xlab = "dum1")
## End(Not run)



