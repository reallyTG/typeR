## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
options(tibble.print_min = 4L, tibble.print_max = 4L)
library(TreeSimGM)
set.seed(1987)
#install.packages("C:/VITAL LOCAL/Meus Documentos/ETH Mestrado/Master/R/package/v.2.2/TreeSimGM_2.2.tar.gz", repos = NULL, type="source")

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
tree <- sim.age(age=3,numbsim=1,"rexp(1.2)")
plot(tree[[1]], main="Simulated tree of age 3")

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
tree <- sim.taxa(numbsim=1, n=5, waitsp="rexp(1.2)")
plot(tree[[1]], main="Simulated tree with 5 living tips")

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
tree <- sim.taxa(numbsim=1, n=5, m=10, waitsp="rexp(1.2)", waitext="rexp(1.1)", gsa=TRUE)
plot(tree[[1]], main="Returned tree with 5 living tips from simulated tree with 10 tips")

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
tree <- sim.age(age=2, numbsim=100, waitsp="rexp(1)", waitext="rexp(1)")
table(unlist(lapply(tree, class)))

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
tree[[100]]

## ------------------------------------------------------------------------
?rweibull

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
set.seed(1989)
tree <- sim.age(3,1,"rweibull(0.4,3)", "rexp(0.1)")
plot(tree[[1]])

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
set.seed(1989) # setting the same seed as before...
tree_funk <- sim.age(3,1,waitsp=function()rweibull(1,0.4,3), waitext=function()rexp(1,0.1))

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
identical(tree, tree_funk)
par(mfrow=c(1,2))
plot(tree[[1]], main="tree (strings)")
plot(tree_funk[[1]], main="tree_funk (function)")

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
waitspfunk <- function() {
wt=rexp(1,1.5)
if(wt<0.5){wt=0.5}
return(wt)
}

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
funk_tree <- sim.age(age=2, numbsim=1, waitsp=waitspfunk)
plot(funk_tree[[1]])

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
symmetric_tree <- sim.age(age=10, numbsim=1, waitsp=function()2, waitext=function()2.5, symmetric=TRUE)
asymmetric_tree <- sim.age(age=10, numbsim=1, waitsp=function()2, waitext=function()2.5, symmetric=FALSE)
par(mfrow=c(1,2))
plot(symmetric_tree[[1]], main="Symmetric tree")
plot(asymmetric_tree[[1]], main="Asymmetric tree")

## ---- warning = FALSE, message = FALSE, fig.width = 7, fig.height=7------
tree <- sim.age(age=2, numbsim=1, waitsp="rexp(1.5)", shiftsp=list(prob=0.1, strength="runif(0.3,0.5)"))
plot(tree[[1]], main="Yule tree with speciation shifts")

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
tree <- sim.taxa(numbsim=5, n=6, waitsp="rexp(1)", waitext="rexp(0.5)", 
                 shiftsp=list(prob=0.1, strength=function()0.5), 
                 shiftext=list(prob=0.1, strength=function()0.1 ),
                 tiplabel=c("living bird ", "ext bird ","SPshift", "EXTshift"))
plot(tree[[1]], main="crBD tree with speciation and extinction shifts")

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
length(tree)

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
t1 <- tree[[1]]
t1$shifted.sp.living

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
t1$shifted.sp.living[t1$shifted.sp.living[,2]==1,1]

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
#which?
shifted_living <- unique(t1$shifted.sp.living[t1$shifted.sp.living[,2]==1,1], t1$shifted.ext.living[t1$shifted.ext.living[,2]==1,1])
print(shifted_living)
#howmany?
length(shifted_living)

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
t1$shiftsp

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
track.shift(shift="sp", tree=t1, node=4)
track.shift(shift="sp", tree=t1, node=5)
track.shift(shift="sp", tree=t1, node=6)

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
tree <- sim.taxa(100, 5, waitsp="rweibull(0.5,2)", symmetric=FALSE, shiftsp=list(prob=0.3, strength="runif(0.5,0.9)"), sampling=list(frac=0.5, branchprop=FALSE))

## ---- warning = FALSE, message = FALSE, fig.width = 7--------------------
par(mfrow=c(2,2), mai=c(0.2,0.2,0.2,0.2))
plot(tree[[3]]$beforesampling, main="complete tree 3")
plot(tree[[3]], main="sampled tree 3")
plot(tree[[60]]$beforesampling, main="complete tree 60")
plot(tree[[60]], main="sampled tree 60")

