library(POT)


### Name: retlev
### Title: Return Level Plot
### Aliases: retlev retlev.mcpot retlev.uvpot
### Keywords: hplot

### ** Examples


#for uvpot class
x <- rgpd(75, 1, 2, 0.1)
pwmu <- fitgpd(x, 1, "pwmu")
rl.fun <- retlev(pwmu)
rl.fun(100)

#for mcpot class
data(ardieres)
Mcalog <- fitmcgpd(ardieres[,"obs"], 5, "alog")
retlev(Mcalog, opy = 990)



