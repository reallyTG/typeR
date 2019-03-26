library(MAd)


### Name: mareg
### Title: Meta-Regression
### Aliases: mareg

### ** Examples

# install metafor
# install.packages('metafor', dependencies = TRUE)

# Sample data
data(dat.sim.final)


# Examples

# OMNIBUS
m0 <- mareg(es~1, var=var, data=dat.sim.final)
summary(m0)

# META-REGRESSION
m1 <- mareg(es~dose, var=var, data=dat.sim.final)
summary(m1)  # SINGLE MODERATOR

m2 <- mareg(es~stress, var=var, data=dat.sim.final)
summary(m2)  # SINGLE MODERATOR

m3 <- mareg(es~dose + stress, var=var, data=dat.sim.final)
summary(m3)  # MULTIPLE MODERATOR  



