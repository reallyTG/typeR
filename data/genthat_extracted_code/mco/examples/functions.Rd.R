library(mco)


### Name: functions
### Title: MCO test problems
### Aliases: belegundu belegundu.constr binh1 binh2 binh2.constr binh3 deb3
###   fonseca1 fonseca2 gianna hanne1 hanne1.constr hanne2 hanne2.constr
###   hanne3 hanne3.constr hanne4 hanne4.constr hanne5 hanne5.constr
###   jimenez jimenez.constr vnt zdt1 zdt2 zdt3

### ** Examples

## Not run: 
##D nsga2(belegundu, 2, 2,
##D       constraints=belegundu.constr, cdim=2,
##D       lower.bounds=c(0, 0), upper.bounds=c(5, 3))
##D 
##D nsga2(binh1, 2, 2,
##D       lower.bounds=c(-5, -5), upper.bounds=c(10, 10))
##D nsga2(binh2, 2, 2,
##D       lower.bounds=c(0, 0), upper.bounds=c(5, 3),
##D       constraints=binh2.constr, cdim=2)
##D 
##D nsga2(binh3, 2, 3,
##D       lower.bounds=c(10e-6, 10e-6), upper.bounds=c(10e6, 10e6))
##D 
##D nsga2(deb3, 2, 2,
##D       lower.bounds=c(0, 0), upper.bounds=c(1, 1),
##D       generations=500)
##D 
##D nsga2(fonseca1, 2, 2,
##D       lower.bounds=c(-100, -100), upper.bounds=c(100, 100))
##D 
##D nsga2(fonseca2, 2, 2,
##D       lower.bounds=c(-4, -4), upper.bounds=c(4, 4))
##D 
##D nsga2(gianna, 1, 2,
##D       lower.bounds=5, upper.bounds=10)
##D 
##D nsga2(hanne1, 2, 2,
##D       lower.bounds=c(0, 0), upper.bounds=c(10, 10),
##D       constraints=hanne1.constr, cdim=1)
##D 
##D nsga2(hanne2, 2, 2,
##D       lower.bounds=c(0, 0), upper.bounds=c(10, 10),
##D       constraints=hanne2.constr, cdim=1)
##D 
##D nsga2(hanne3, 2, 2,
##D       lower.bounds=c(0, 0), upper.bounds=c(10, 10),
##D       constraints=hanne3.constr, cdim=1)
##D 
##D nsga2(hanne4, 2, 2,
##D       lower.bounds=c(0, 0), upper.bounds=c(10, 10),
##D       constraints=hanne4.constr, cdim=1)
##D 
##D nsga2(hanne5, 2, 2,
##D       lower.bounds=c(0, 0), upper.bounds=c(10, 10),
##D       constraints=hanne5.constr, cdim=1)
##D 
##D nsga2(jimenez, 2, 2,
##D       lower.bounds=c(0, 0), upper.bounds=c(100, 100),
##D       constraints=jimenez.constr, cdim=4)
##D 
##D nsga2(vnt, 2, 3,
##D       lower.bounds=rep(-3, 2), upper.bounds=rep(3, 2))
##D 
##D nsga2(zdt1, 30, 2,
##D       lower.bounds=rep(0, 30), upper.bounds=rep(1, 30))
##D 
##D nsga2(zdt2, 30, 2,
##D       lower.bounds=rep(0, 30), upper.bounds=rep(1, 30))
##D 
##D nsga2(zdt3, 30, 2,
##D       lower.bounds=rep(0, 30), upper.bounds=rep(1, 30))
## End(Not run)



