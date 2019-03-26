library(secr)


### Name: rbind.capthist
### Title: Combine capthist Objects
### Aliases: rbind.capthist MS.capthist
### Keywords: manip

### ** Examples


## extend a multi-session object
## we fake the 2010 data by copying from 2005
## note how we name the appended session
fakeCH <- ovenCH[["2005"]]
MS.capthist(ovenCH, "2010" = fakeCH)

## simulate sessions for 2-part mixture
temptrap <- make.grid(nx = 8, ny = 8)
temp1 <- sim.capthist(temptrap,
    detectpar = list(g0 = 0.1, sigma = 40))
temp2 <- sim.capthist(temptrap,
    detectpar = list(g0 = 0.2, sigma = 20))

## concatenate sessions
temp3 <- MS.capthist(large.range = temp1, small.range = temp2)
summary(temp3)
## session-specific movement statistic
RPSV(temp3)

## pool sessions
temp4 <- rbind(temp1, temp2)
summary(temp4)
RPSV(temp4)

## compare mixture to sum of components
## note `detectors visited' is not additive for 'multi' detector
## nor is `detectors used'
(summary(temp1)$counts +  summary(temp2)$counts) -
    summary(temp4)$counts

## Not run: 
##D ## compare two different model fits 
##D tempfit3 <- secr.fit(temp3, CL = TRUE, buffer = 150, model = list
##D     (g0 ~ session, sigma ~ session), trace = FALSE)
##D predict(tempfit3)
##D 
##D ## if we can tell which animals had large ranges...
##D covariates(temp4) <- data.frame(range.size = rep(c("large",
##D     "small"), c(nrow(temp1), nrow(temp2))))
##D tempfit4 <- secr.fit(temp4, CL = TRUE, buffer = 150, model = list
##D     (g0 ~ range.size, sigma ~ range.size), trace = FALSE)
##D predict(tempfit4, newdata = data.frame(range.size = c("large",
##D     "small")))
## End(Not run)




