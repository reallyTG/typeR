library(agridat)


### Name: mead.lamb
### Title: Number of lambs born to 3 breeds on 3 farms
### Aliases: mead.lamb
### Keywords: datasets

### ** Examples


library(agridat)
data(mead.lamb)
dat <- mead.lamb

# farm 1 has more ewes in lambclass 3
d2 <- xtabs(y ~ farm+breed+lambclass, data=dat)
mosaicplot(d2, color=c("lemonchiffon1","moccasin","lightsalmon1","indianred"),
           xlab="farm/lambclass", ylab="breed", main="mead.lamb")

names(dat) <- c('F','B','L','y') # for compactness
# Match totals in Mead example 14.6
if(require(dplyr)){
  dat <- group_by(dat, F,B)
  summarize(dat, y=sum(y))
  ##          F      B     y
  ##   <fctr> <fctr> <int>
  ## 1     F1      A   150
  ## 2     F1      B    46
  ## 3     F1      C    78
  ## 4     F2      A    72
  ## 5     F2      B    79
  ## 6     F2      C    28
  ## 7     F3      A   224
  ## 8     F3      B   129
  ## 9     F3      C    34
}

# Models
m1 <- glm(y ~ F + B + F:B, data=dat,
          family=poisson(link=log))
m2 <- update(m1, y ~ F + B + F:B + L)
m3 <- update(m1, y ~ F + B + F:B + L + B:L)
m4 <- update(m1, y ~ F + B + F:B + L + F:L)
m5 <- update(m1, y ~ F + B + F:B + L + B:L + F:L)

AIC(m1, m2, m3, m4, m5) # Model 4 has best AIC
##    df      AIC
## m1  9 852.9800
## m2 12 306.5457
## m3 18 303.5781
## m4 18 206.1520
## m5 24 213.8873

# Change contrasts for Miroslav
m4 <- update(m4,
             contrasts=list(F=contr.sum,B=contr.sum,L=contr.sum))
summary(m4)

# Match deviance table from Mead
if(require(broom)){
  all <- do.call(rbind, lapply(list(m1, m2, m3, m4, m5), broom::glance))
  all$model <- unlist(lapply(list(m1, m2, m3, m4, m5),
                                 function(x) as.character(formula(x)[3])))
  all[,c('model','deviance','df.residual')]
  ##                         model  deviance df.residual
  ## 1                 F + B + F:B 683.67257          27
  ## 2             F + B + L + F:B 131.23828          24
  ## 3       F + B + L + F:B + B:L 116.27069          18
  ## 4       F + B + L + F:B + F:L  18.84460          18
  ## 5 F + B + L + F:B + B:L + F:L  14.57987          12
}

## Not run: 
##D   # Using MASS::loglm
##D   library(MASS)
##D   # Note: without 'fitted=TRUE', devtools::run_examples has an error
##D   m4b <- MASS::loglm(y ~ F + B + F:B + L + F:L, data = dat, fitted=TRUE)
##D   # Table of farm * class interactions. Match Mead p. 360
##D   round(coef(m4b)$F.L,2)
##D   fitted(m4b)
##D   resid(m4b)
##D   # require(vcd)
##D   # mosaic(m4b, shade=TRUE,
##D   # formula = ~ F + B + F:B + L + F:L,
##D   # residual_type="rstandard", keep_aspect=FALSE)
## End(Not run)



