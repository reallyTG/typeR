library(MEMSS)


### Name: Orange
### Title: Growth of orange trees
### Aliases: Orange
### Keywords: datasets

### ** Examples

require(lattice)
xyplot(circumference ~ age, Orange, groups = Tree, type = c("g", "b"),
       auto.key = list(space = "right", lines = TRUE), aspect = "xy",
       xlab = "Age (days since 1968/12/31)", ylab = "Circumference (mm)")
## Not run: 
##D m1 <- nlmer(circumference ~ SSlogis(age, Asym, xmid, scal) ~ Asym|Tree,
##D             Orange, verbose = TRUE,
##D             start = c(Asym = 190, xmid = 730, scal = 350))
##D .Call("mer_optimize", m1, 1L, 1L, PACKAGE = "lme4")
##D print(m1)
##D ranef(m1)
## End(Not run)



