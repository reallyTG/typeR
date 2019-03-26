library(simsalapar)


### Name: grid-stuff
### Title: Tools For Working with Variable Specification Lists
### Aliases: getEl mkGrid mkNms get.n.sim set.n.sim get.nonGrids
### Keywords: utilities

### ** Examples

vList <-
 varlist(n.sim = list(type="N", expr = quote(N[sim]), value = 64),
         n     = list(type="grid",
                      value = c(20, 100, 500)), # sample sizes
         p     = list(type="grid",
                      value = c(3, 7, 15, 25)), # dimensions
         meth  = list(type="grid", expr = quote(italic(method)),
                      value = c("classical", "robust")))

getEl(vList, type="grid") # for those of type "grid", get all values
## for those of type "grid", get all components :
str(getEl(vList, type="grid", comp=NA))
stopifnot(identical(as(vList, "list"),
                    getEl(vList, type=c("N","grid"), comp = NA)))

(grd <- mkGrid(vList))
stopifnot(nrow(grd) == 3*4*2, ncol(grd) == 3)

getEl(vList)# -> all "value"s: the same as lapply(., `[[`, "value") :
stopifnot(identical(lapply(vList, `[[`, "value"),
                    getEl(vList)))
mkNms(vList)
mkNms(vList, addNms=TRUE)

get.n.sim(vl. <- set.n.sim(vList, NULL)) # 1
vl.$n.sim # NULL
set.n.sim(vl., 12)
## Don't show: 
stopifnot(is.null(vl.$n.sim),
	  identical(set.n.sim(vl., 12)$n.sim,
		    list(value = 12, type = "N", expr = quote(N[sim]))))
## End(Don't show)



