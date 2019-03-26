library(VGAM)


### Name: multinomial
### Title: Multinomial Logit Model
### Aliases: multinomial
### Keywords: models regression

### ** Examples

# Example 1: fit a multinomial logit model to Edgar Anderson's iris data
data(iris)
## Not run: 
##D  fit <- vglm(Species ~ ., multinomial, iris)
##D coef(fit, matrix = TRUE) 
## End(Not run)

# Example 2a: a simple example
ycounts <- t(rmultinom(10, size = 20, prob = c(0.1, 0.2, 0.8)))  # Counts
fit <- vglm(ycounts ~ 1, multinomial)
head(fitted(fit))   # Proportions
fit@prior.weights   # NOT recommended for extraction of prior weights
weights(fit, type = "prior", matrix = FALSE)  # The better method
depvar(fit)         # Sample proportions; same as fit@y
constraints(fit)    # Constraint matrices

# Example 2b: Different reference level used as the baseline
fit2 <- vglm(ycounts ~ 1, multinomial(refLevel = 2))
coef(fit2, matrix = TRUE)
coef(fit , matrix = TRUE)  # Easy to reconcile this output with fit2

# Example 3: The response is a factor.
nn <- 10
dframe3 <- data.frame(yfac = gl(3, nn, labels = c("Ctrl", "Trt1", "Trt2")),
                      x2   = runif(3 * nn))
myrefLevel <- with(dframe3, yfac[12])
fit3a <- vglm(yfac ~ x2, multinomial(refLevel = myrefLevel), dframe3)
fit3b <- vglm(yfac ~ x2, multinomial(refLevel = 2), dframe3)
coef(fit3a, matrix = TRUE)  # "Trt1" is the reference level
coef(fit3b, matrix = TRUE)  # "Trt1" is the reference level
margeff(fit3b)

# Example 4: Fit a rank-1 stereotype model
fit4 <- rrvglm(Country ~ Width + Height + HP, multinomial, data = car.all)
coef(fit4)  # Contains the C matrix
constraints(fit4)$HP       # The A matrix
coef(fit4, matrix = TRUE)  # The B matrix
Coef(fit4)@C               # The C matrix
concoef(fit4)              # Better to get the C matrix this way
Coef(fit4)@A               # The A matrix
svd(coef(fit4, matrix = TRUE)[-1, ])$d  # This has rank 1; = C %*% t(A)
# Classification (but watch out for NAs in some of the variables):
apply(fitted(fit4), 1, which.max)  # Classification
colnames(fitted(fit4))[apply(fitted(fit4), 1, which.max)]  # Classification
apply(predict(fit4, car.all, type = "response"), 1, which.max)  # Ditto


# Example 5: The use of the xij argument (aka conditional logit model)
set.seed(111)
nn <- 100  # Number of people who travel to work
M <- 3  # There are M+1 models of transport to go to work
ycounts <- matrix(0, nn, M+1)
ycounts[cbind(1:nn, sample(x = M+1, size = nn, replace = TRUE))] = 1
dimnames(ycounts) <- list(NULL, c("bus","train","car","walk"))
gotowork <- data.frame(cost.bus  = runif(nn), time.bus  = runif(nn),
                       cost.train= runif(nn), time.train= runif(nn),
                       cost.car  = runif(nn), time.car  = runif(nn),
                       cost.walk = runif(nn), time.walk = runif(nn))
gotowork <- round(gotowork, digits = 2)  # For convenience
gotowork <- transform(gotowork,
                      Cost.bus   = cost.bus   - cost.walk,
                      Cost.car   = cost.car   - cost.walk,
                      Cost.train = cost.train - cost.walk,
                      Cost       = cost.train - cost.walk,  # for labelling
                      Time.bus   = time.bus   - time.walk,
                      Time.car   = time.car   - time.walk,
                      Time.train = time.train - time.walk,
                      Time       = time.train - time.walk)  # for labelling
fit <- vglm(ycounts ~ Cost + Time,
            multinomial(parall = TRUE ~ Cost + Time - 1),
            xij = list(Cost ~ Cost.bus + Cost.train + Cost.car,
                       Time ~ Time.bus + Time.train + Time.car),
            form2 =  ~ Cost + Cost.bus + Cost.train + Cost.car +
                       Time + Time.bus + Time.train + Time.car,
            data = gotowork, trace = TRUE)
head(model.matrix(fit, type = "lm"))   # LM model matrix
head(model.matrix(fit, type = "vlm"))  # Big VLM model matrix
coef(fit)
coef(fit, matrix = TRUE)
constraints(fit)
summary(fit)
max(abs(predict(fit) - predict(fit, new = gotowork)))  # Should be 0



