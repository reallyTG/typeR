library(MEMSS)


### Name: Cefamandole
### Title: Pharmacokinetics of Cefamandole
### Aliases: Cefamandole
### Keywords: datasets

### ** Examples

require(lattice)
str(Cefamandole)
xyplot(conc ~ Time, Cefamandole, groups = Subject, type = c("g", "b"),
       aspect = 'xy', scales = list(y = list(log = 2)),
       auto.key = list(space = "right", lines= TRUE))
xyplot(conc ~ Time|Subject, Cefamandole, type = c("g", "b"),
       index.cond = function(x,y) min(y), aspect = 'xy',
       scales = list(y = list(log = 2)))
#fm1 <- nlsList(SSbiexp, data = Cefamandole)



