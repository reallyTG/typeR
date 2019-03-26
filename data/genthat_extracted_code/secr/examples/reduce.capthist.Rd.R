library(secr)


### Name: reduce.capthist
### Title: Combine Occasions Or Detectors
### Aliases: reduce.traps reduce.capthist
### Keywords: manip

### ** Examples

tempcapt <- sim.capthist (make.grid(nx = 6, ny = 6), nocc = 6)
class(tempcapt)

pooled.tempcapt <- reduce(tempcapt, newocc = list(1,2:3,4:6))
summary (pooled.tempcapt)

pooled.tempcapt2 <- reduce(tempcapt, by = 2)
summary (pooled.tempcapt2)

## collapse multi-session dataset to single-session 'open population'
onesess <- join(reduce(ovenCH, by = "all"))
summary(onesess)

# group detectors within 60 metres
plot (traps(captdata))
plot (reduce(captdata, span = 60), add = TRUE)

# plot linking old and new
old <- traps(captdata)
new <- reduce(old, span = 60)
newtrap <- attr(new, "newtrap")
plot(old, border = 10)
plot(new, add = TRUE, detpar = list(pch = 16), label = TRUE)
segments (new$x[newtrap], new$y[newtrap], old$x, old$y)

## Not run: 
##D 
##D # compare binary proximity with collapsed binomial count
##D # expect TRUE for each year
##D for (y in 1:5) {
##D     CHA <- abs(ovenCHp[[y]])   ## abs() to ignore one death
##D     usage(traps(CHA)) <- matrix(1, 44, ncol(CHA))
##D     CHB <- reduce(CHA, by = 'all', output = 'count')
##D     # summary(CHA, terse = TRUE)
##D     # summary(CHB, terse = TRUE)
##D     fitA <- secr.fit(CHA, buffer = 300, trace = FALSE)
##D     fitB <- secr.fit(CHB, buffer = 300, trace = FALSE, binomN = 1, biasLimit = NA)
##D     A <- predict(fitA)[,-1] 
##D     B <- predict(fitB)[,-1]
##D     cat(y, ' ', all(abs(A-B)/A < 1e-5), '\n')
##D }
##D ## multi-session fit
##D ## expect TRUE overall
##D CHa <- ovenCHp
##D for (y in 1:5) {
##D     usage(traps(CHa[[y]])) <- matrix(1, 44, ncol(CHa[[y]]))
##D     CHa[[y]][,,] <- abs(CHa[[y]][,,])
##D }
##D CHb <- reduce(CHa, by = 'all', output = 'count')
##D summary(CHa, terse = TRUE)
##D summary(CHb, terse = TRUE)
##D fita <- secr.fit(CHa, buffer = 300, trace = FALSE)
##D fitb <- secr.fit(CHb, buffer = 300, trace = FALSE, binomN = 1, biasLimit = NA)
##D A <- predict(fita)[[1]][,-1] 
##D B <- predict(fitb)[[1]][,-1]
##D all(abs(A-B)/A < 1e-5)
##D 
## End(Not run)




