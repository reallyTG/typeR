library(agridat)


### Name: gomez.nonnormal2
### Title: RCB trial of rice measuring white heads
### Aliases: gomez.nonnormal2
### Keywords: datasets

### ** Examples


data(gomez.nonnormal2)
dat <- gomez.nonnormal2

# Gomez suggested sqrt transform
dat <- transform(dat, twhite = sqrt(white+.5))

# QQ plots for raw/transformed data
if(require(reshape2) & require(lattice))
  qqmath( ~ value|variable, data=melt(dat),
         main="gomez.nonnormal2 - raw/transformed QQ plot",
         scales=list(relation="free"))

# Gomez anova table 7.21
m1 <- lm(twhite ~ rep + gen, data=dat)
anova(m1)
## Response: twhite2
##           Df Sum Sq Mean Sq F value    Pr(>F)    
## rep        2  2.401  1.2004  1.9137    0.1678    
## gen       13 48.011  3.6931  5.8877 6.366e-05 ***
## Residuals 26 16.309  0.6273                      




