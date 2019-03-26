library(gamlss.dist)


### Name: ZIPF
### Title: The zipf and zero adjusted zipf distributions for fitting a
###   GAMLSS model
### Aliases: ZIPF dZIPF pZIPF qZIPF rZIPF zetaP ZAZIPF dZAZIPF pZAZIPF
###   qZAZIPF rZAZIPF
### Keywords: distribution regression

### ** Examples

# ZIPF
par(mfrow=c(2,2))
y<-seq(1,20,1)
plot(y, dZIPF(y), type="h")
q <- seq(1, 20, 1)
plot(q, pZIPF(q), type="h")
p<-seq(0.0001,0.999,0.05)
plot(p , qZIPF(p), type="s")
dat <- rZIPF(100)
hist(dat)
# ZAZIPF
y<-seq(0,20,1)
plot(y, dZAZIPF(y,  mu=.9, sigma=.1), type="h")
q <- seq(1, 20, 1)
plot(q, pZAZIPF(q,  mu=.9, sigma=.1), type="h")
p<-seq(0.0001,0.999,0.05)
plot(p, qZAZIPF(p,  mu=.9, sigma=.1), type="s")
dat <- rZAZIPF(100, mu=.9, sigma=.1)
hist(dat)



