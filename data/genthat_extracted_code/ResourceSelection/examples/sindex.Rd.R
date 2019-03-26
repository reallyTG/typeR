library(ResourceSelection)


### Name: sindex
### Title: Weighted relative suitability index
### Aliases: wrsi sindex
### Keywords: models

### ** Examples

## --- habitat composition matrix
set.seed(1234)
n <- 1000 # sample size
k <- 5 # habitat classes
s <- runif(n, 1, 5)
p <- plogis(rnorm(n*k, 0, rep(s, k)))
p <- p*t(replicate(n, sample(c(10,4,2,1,1))))
x <- p / rowSums(p)
summary(x)
summary(rowSums(x))

## --- observations
## expected abundance in each habitat class
lam <- c(0.8, 0.6, 0.5, 0.4, 0.1)*1
## sample x habitat level abundances
yy <- t(sapply(seq_len(n), function(i) {
    ## intercept and modifier combined
    rpois(k, (x[i,]*lam))
    }))
## total: sum over habitat classes
## this is what we observe
y <- rowSums(yy)
colSums(yy)
table(y)

## --- wrsi calculations
(w <- wrsi(y, x))
op <- par(mfrow=c(1,2))
## habitat level observations are unknown
plot(lam, colSums(yy) / sum(yy), type="b")
## this is approximated by the wrsi
plot(lam, w$rWRSI, type="b")
abline(h=0, lty=2)
par(op)

## --- sindex calculations for multiple species
y2 <- cbind(Spp1=y, Spp2=rev(y), Spp3=sample(y))
(w2 <- sindex(y2, x))
heatmap(t(as.matrix(w2)), scale="none")



