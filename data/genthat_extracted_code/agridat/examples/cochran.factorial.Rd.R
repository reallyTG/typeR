library(agridat)


### Name: cochran.factorial
### Title: Factorial experiment in beans
### Aliases: cochran.factorial
### Keywords: datasets

### ** Examples


data(cochran.factorial)
dat <- cochran.factorial

# Split treatment into individual factors
dat <- transform(dat,
                 d = -1 + 2 * grepl('d',trt),
                 n = -1 + 2 * grepl('n',trt),
                 p = -1 + 2 * grepl('p',trt),
                 k = -1 + 2 * grepl('k',trt))
dat <- transform(dat, d=factor(d), n=factor(n), p=factor(p), k=factor(k))

# Cochran table 6.5.
m1 <- lm(yield ~ rep * block + (d+n+p+k)^3, data=dat)
anova(m1)


if(require(FrF2)){
  aliases(m1)
  MEPlot(m1, select=3:6,
         main="cochran.factorial - main effects plot")
}




