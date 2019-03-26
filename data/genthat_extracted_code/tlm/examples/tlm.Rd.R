library(tlm)


### Name: tlm
### Title: Fitting Linear, Logistic and Poisson Regression Models with
###   Transformed Variables
### Aliases: tlm print.tlm plot.tlm

### ** Examples

### Linear model with log-log transformation:
data(feld1)
head(feld1)
# model fitting in the transformed space:
modcat <-  tlm (y = logroom, x = logmattress, z = cat, data = feld1, ypow = 0, xpow = 0)
modcat
summary(modcat)
# plot of the geometric mean of the response (original space), adjusting for 'cat':
plot(modcat, xname = "Mattress levels", yname = "room levels") 
# plot of the mean of the log of response (transformed space), adjusting for 'cat' and
# adding the observations:
plot(modcat, type = "transformed", xname = "mattress levels", yname = "room levels",
     observed = TRUE)
# diagnosis plot:
plot(modcat, type = "diagnosis")

### The same model but now considering 'cat' as the explanatory variable of interest:
modcat2 <-  tlm (y = logroom, x = cat, z = logmattress, data = feld1, ypow = 0)
summary(modcat2)
# plot of the geometric mean of the response (original space), adjusting
# for mattress levels:
plot(modcat2, xname = "Cat", yname = "room levels") 
# plot of the mean of the log of response (transformed space), adjusting
# for mattress levels:
plot(modcat2, type = "transformed", xname = "Cat", yname = "room levels")



