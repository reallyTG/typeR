library(lfe)


### Name: btrap
### Title: Bootstrap standard errors for the group fixed effects
### Aliases: btrap

### ** Examples


oldopts <- options(lfe.threads=2)
## create covariates
x <- rnorm(3000)
x2 <- rnorm(length(x))

## create individual and firm
id <- factor(sample(700,length(x),replace=TRUE))
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
alpha <- getfe(est)
head(alpha)
## bootstrap standard errors
head(btrap(alpha,est))

## bootstrap some differences
ef <- function(v,addnames) {
  w <- c(v[2]-v[1],v[3]-v[2],v[3]-v[1])
  if(addnames) {
     names(w) <-c('id2-id1','id3-id2','id3-id1')
     attr(w,'extra') <- list(note=c('line1','line2','line3'))
  }
  w
}
# check that it's estimable
is.estimable(ef,est$fe)

head(btrap(alpha,est,ef=ef))
options(oldopts)




