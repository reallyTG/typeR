library(lfe)


### Name: getfe
### Title: Retrieve the group fixed effects
### Aliases: getfe
### Keywords: models regression

### ** Examples


oldopts <- options(lfe.threads=2)
## create covariates
x <- rnorm(4000)
x2 <- rnorm(length(x))

## create individual and firm
id <- factor(sample(500,length(x),replace=TRUE))
firm <- factor(sample(300,length(x),replace=TRUE))

## effects
id.eff <- rlnorm(nlevels(id))
firm.eff <- rexp(nlevels(firm))

## left hand side
y <- x + 0.25*x2 + id.eff[id] + firm.eff[firm] + rnorm(length(x))

## estimate and print result
est <- felm(y ~ x+x2 | id + firm)
summary(est)
## extract the group effects
alpha <- getfe(est,se=TRUE)

## find some estimable functions, with standard errors, we don't get
## names so we must precompute some numerical indices in ef
idx <- match(c('id.5','id.6','firm.11','firm.12'),rownames(alpha))
alpha[idx,]
ef <- function(v,addnames) {
  w <- c(v[idx[[2]]]-v[idx[[1]]],v[idx[[4]]]+v[idx[[1]]],
         v[idx[[4]]]-v[idx[[3]]])
  if(addnames) names(w) <-c('id6-id5','f12+id5','f12-f11')
  w
}
getfe(est,ef=ef,se=TRUE)
options(oldopts)
## Not run: 
##D summary(lm(y ~ x+x2+id+firm-1))
## End(Not run)




