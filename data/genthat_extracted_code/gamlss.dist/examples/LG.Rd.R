library(gamlss.dist)


### Name: LG
### Title: Logarithmic and zero adjusted logarithmic distributions for
###   fitting a GAMLSS model
### Aliases: LG dLG pLG qLG rLG ZALG dZALG pZALG qZALG rZALG
### Keywords: distribution regression

### ** Examples

LG() 
ZAP()
# creating data and plotting them 
 dat <- rLG(1000, mu=.3)
   r <- barplot(table(dat), col='lightblue')
dat1 <- rZALG(1000, mu=.3, sigma=.1)
  r1 <- barplot(table(dat1), col='lightblue')



