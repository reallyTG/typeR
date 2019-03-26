library(openCR)


### Name: make.table
### Title: Tabulate Estimates From Multiple Models
### Aliases: make.table
### Keywords: manip

### ** Examples


arglist <- list(constant = list(capthist=ovenCHp, model=phi~1), 
                session.specific = list(capthist=ovenCHp, model=phi~session))
fits <- par.openCR.fit(arglist, trace = FALSE)
print(make.table(fits), na=".")




