library(agridat)


### Name: chinloy.fractionalfactorial
### Title: Sugarcane fractional factorial 1/3 3^5
### Aliases: chinloy.fractionalfactorial
### Keywords: datasets

### ** Examples

data(chinloy.fractionalfactorial)
dat <- chinloy.fractionalfactorial

# Treatments are coded with levels 0,1,2. Make sure they are factors
dat <- transform(dat,
                 N=factor(N), P=factor(P), K=factor(K), B=factor(B), F=factor(F))

# Experiment layout
if(require(desplot)){
  desplot(yield ~ col*row, dat, out1=block, text=trt, shorten="no", cex=0.6,
          aspect=178/86,
          main="chinloy.fractionalfactorial")
}

# Main effect and some two-way interactions. These match Chinloy table 6.
# Not sure how to code terms like P^2K=B^2F
m1 <- aov(yield ~ block + N + P + K + B + F + N:P + N:K + N:B + N:F, dat)
anova(m1)




