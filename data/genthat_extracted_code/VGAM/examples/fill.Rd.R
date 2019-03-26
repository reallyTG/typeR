library(VGAM)


### Name: fill
### Title: Creates a Matrix of Appropriate Dimension
### Aliases: fill fill1
### Keywords: models regression

### ** Examples

fill(runif(5))
fill(runif(5), ncol = 3)
fill(runif(5), val = 1, ncol = 3)

# Generate eyes data for the examples below. Eyes are independent (OR=1).
nn <- 1000  # Number of people
eyesdata <- data.frame(lop = round(runif(nn), 2),
                       rop = round(runif(nn), 2),
                       age = round(rnorm(nn, 40, 10)))
eyesdata <- transform(eyesdata,
    mop = (lop + rop) / 2,        # Mean ocular pressure
    op  = (lop + rop) / 2,        # Value unimportant unless plotting
#   op  =  lop,                   # Choose this if plotting
    eta1 = 0 - 2*lop + 0.04*age,  # Linear predictor for left eye
    eta2 = 0 - 2*rop + 0.04*age)  # Linear predictor for right eye
eyesdata <- transform(eyesdata,
    leye = rbinom(nn, size = 1, prob = logit(eta1, inverse = TRUE)),
    reye = rbinom(nn, size = 1, prob = logit(eta2, inverse = TRUE)))

# Example 1
# All effects are linear
fit1 <- vglm(cbind(leye,reye) ~ op + age,
             family = binom2.or(exchangeable = TRUE, zero = 3),
             data = eyesdata, trace = TRUE,
             xij = list(op ~ lop + rop + fill(lop)),
             form2 =  ~ op + lop + rop + fill(lop) + age)
head(model.matrix(fit1, type = "lm"))   # LM model matrix
head(model.matrix(fit1, type = "vlm"))  # Big VLM model matrix
coef(fit1)
coef(fit1, matrix = TRUE)  # Unchanged with 'xij'
constraints(fit1)
max(abs(predict(fit1)-predict(fit1, new = eyesdata)))  # Predicts correctly
summary(fit1)
## Not run: 
##D plotvgam(fit1, se = TRUE)  # Wrong, e.g., because it plots against op, not lop.
##D # So set op = lop in the above for a correct plot.
## End(Not run)



# Example 2
# Model OR as a linear function of mop
fit2 <- vglm(cbind(leye,reye) ~ op + age, data = eyesdata, trace = TRUE,
            binom2.or(exchangeable = TRUE, zero = NULL),
            xij   = list(op ~ lop + rop + mop),
            form2 =    ~ op + lop + rop + mop + age)
head(model.matrix(fit2, type = "lm"))   # LM model matrix
head(model.matrix(fit2, type = "vlm"))  # Big VLM model matrix
coef(fit2)
coef(fit2, matrix = TRUE)  # Unchanged with 'xij'
max(abs(predict(fit2) - predict(fit2, new = eyesdata)))  # Predicts correctly
summary(fit2)
## Not run: 
##D plotvgam(fit2, se = TRUE)  # Wrong because it plots against op, not lop.
## End(Not run)


# Example 3. This model uses regression splines on ocular pressure.
# It uses a trick to ensure common basis functions.
BS <- function(x, ...)
  sm.bs(c(x,...), df = 3)[1:length(x), , drop = FALSE]  # trick

fit3 <- vglm(cbind(leye,reye) ~ BS(lop,rop) + age,
             family = binom2.or(exchangeable = TRUE, zero = 3),
             data = eyesdata, trace = TRUE,
             xij = list(BS(lop,rop) ~ BS(lop,rop) +
                                      BS(rop,lop) +
                                      fill(BS(lop,rop))),
             form2 = ~  BS(lop,rop) + BS(rop,lop) + fill(BS(lop,rop)) +
                        lop + rop + age)
head(model.matrix(fit3, type =  "lm"))  # LM model matrix
head(model.matrix(fit3, type = "vlm"))  # Big VLM model matrix
coef(fit3)
coef(fit3, matrix = TRUE)
summary(fit3)
fit3@smart.prediction
max(abs(predict(fit3) - predict(fit3, new = eyesdata)))  # Predicts correctly
predict(fit3, new = head(eyesdata))  # Note the 'scalar' OR, i.e., zero=3
max(abs(head(predict(fit3)) -
             predict(fit3, new = head(eyesdata))))  # Should be 0
## Not run: 
##D plotvgam(fit3, se = TRUE, xlab = "lop")  # Correct
## End(Not run)


# Example 4. Capture-recapture model with ephemeral and enduring
# memory effects. Similar to Yang and Chao (2005), Biometrics.
deermice <- transform(deermice, Lag1 = y1)
M.tbh.lag1 <-
  vglm(cbind(y1, y2, y3, y4, y5, y6) ~ sex + weight + Lag1,
       posbernoulli.tb(parallel.t = FALSE ~ 0,
                       parallel.b = FALSE ~ 0,
                       drop.b = FALSE ~ 1),
       xij = list(Lag1 ~ fill(y1) + fill(y2) + fill(y3) + fill(y4) +
                         fill(y5) + fill(y6) +
                         y1 + y2 + y3 + y4 + y5),
       form2 = ~ sex + weight + Lag1 +
                 fill(y1) + fill(y2) + fill(y3) + fill(y4) +
                 fill(y5) + fill(y6) +
                 y1 + y2 + y3 + y4 + y5 + y6,
       data = deermice, trace = TRUE)
coef(M.tbh.lag1)



