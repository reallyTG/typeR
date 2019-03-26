library(TripleR)


### Name: parCor
### Title: partial correlation
### Aliases: parCor
### Keywords: htest

### ** Examples

data(multiGroup)
data(multiNarc)

# the function 'head' shows the first few lines of a data structure:
head(multiNarc)

# calculate SRA effects for extraversion ratings
RR.style("p")
RR1 <- RR(ex ~ perceiver.id * target.id | group.id, multiGroup, na.rm=TRUE)

# merge variables to one data set
dat <- merge(RR1$effects, multiNarc, by="id")

# We now have a combined data set with SRA effects and external self ratings:
head(dat)

# function parCor(x, y, z) computes partial correlation between x and y, 
# controlled for group membership z
d1 <- parCor(dat$ex.t, dat$narc, dat$group.id)
d1


# disattenuate for target effect reliability
parCor2 <- d1$par.cor * (1/sqrt(attr(RR1$effects$ex.t, "reliability")))
parCor2



