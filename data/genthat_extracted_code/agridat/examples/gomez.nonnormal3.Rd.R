library(agridat)


### Name: gomez.nonnormal3
### Title: RCB of 12 rice varieties with leafhopper survival
### Aliases: gomez.nonnormal3
### Keywords: datasets

### ** Examples

data(gomez.nonnormal3)
dat <- gomez.nonnormal3

# First, replace 0, 100 values
dat$thoppers <- dat$hoppers
dat <- transform(dat, thoppers=ifelse(thoppers==0, 1/(4*75), thoppers))
dat <- transform(dat, thoppers=ifelse(thoppers==100, 100-1/(4*75), thoppers))
# Arcsin transformation of percentage p converted to degrees
# is arcsin(sqrt(p))/(pi/2)*90
dat <- transform(dat, thoppers=asin(sqrt(thoppers/100))/(pi/2)*90)

# QQ plots for raw/transformed data
if(require(reshape2) & require(lattice))
  qqmath( ~ value|variable, data=melt(dat),
         main="gomez.nonnormal3 - raw/transformed QQ plot",
         scales=list(relation="free"))

m1 <- lm(thoppers ~ gen, data=dat)
anova(m1) # Match Gomez table 7.25
## Response: thoppers
##           Df  Sum Sq Mean Sq F value    Pr(>F)    
## gen       11 16838.7 1530.79  16.502 1.316e-08 ***
## Residuals 24  2226.4   92.77                      




