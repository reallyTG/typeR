library(MAc)


### Name: wd
### Title: Output to Word in formatted tables
### Aliases: wd
### Keywords: word

### ** Examples

# Sample data
id<-c(1:20)
n<-c(10,20,13,22,28,12,12,36,19,12,36,75,33,121,37,14,40,16,14,20)
r<-c(.68,.56,.23,.64,.49,-.04,.49,.33,.58,.18,-.11,.27,.26,.40,.49,
.51,.40,.34,.42,.16)
mod1<-c(1,2,3,4,1,2,8,7,5,3,9,7,5,4,3,2,3,5,7,1)
dat<-data.frame(id,n,r,mod1)
dat$var.r <- var_r(dat$r, dat$n) # MAc function to derive variance
dat$z <- r_to_z(dat$r)  # MAc function to convert to Fisher's z (z')
dat$var.z <- var_z(dat$n)  # MAc function for variance of z'
dat$mods2 <- factor(rep(1:2, 10))
dat

# Examples

# install R2wd
# install.packages('R2wd', dependencies = TRUE)

# mareg fuction
temp <- mareg(r~ mod1 + mods2, var = var.r, method = "REML",  data = dat)

# Export data to Word in formatted table
## Not run: wd(temp, get = TRUE, new = TRUE)



