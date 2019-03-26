library(RRreg)


### Name: RRmixed
### Title: Mixed Effects Logistic Regression for RR Data
### Aliases: RRmixed

### ** Examples

# generate data with a level-1 predictor 
set.seed(1234)
d <- data.frame(group=factor(rep(LETTERS[1:20],each=50)), 
                cov=rnorm(20*50))
# generate dependent data based on logistic model (random intercept):
d$true <- simulate(~  cov + (1|group), newdata=d,
                     family=binomial(link="logit"),
                     newparams=list(beta=c("(Intercept)"=-.5, cov=1),
                                    theta=c("group.(Intercept)"=.8)))[[1]]
# scramble responses using RR:
model <- "FR"
p <- c(true0=.1, true1=.2)
d$resp <- RRgen(model="FR", p=p, trueState=d$true)$response
# fit model:
mod <- RRmixed(resp ~  cov +(1|group), data=d, model="FR", p=p)
summary(mod)



