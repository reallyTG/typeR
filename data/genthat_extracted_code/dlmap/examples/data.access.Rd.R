library(dlmap)


### Name: data access
### Title: Data summaries of dlcross and dlmap objects
### Aliases: ngen nphen nmrk ngen.dlcross ngen.dlmap nphen.dlcross
###   nphen.dlmap nmrk.dlcross nmrk.dlmap

### ** Examples

# load dataset
data(BSdat)
data(BSphe2)

## Not run: 
##D # convert data to dlmap format
##D dl.in1 <- dlcross(format="rqtl", genobj=BSdat, idname="ID", fixpos=1)
##D 
##D ngen(dl.in1)
##D nphen(dl.in1)
##D nmrk(dl.in1)
##D 
##D # convert data with separate phenotypic trait file
##D dl.in2 <- dlcross(format="rqtl", genobj=BSdat, pheobj=BSphe2, idname="ID", step=5)
##D 
##D ngen(dl.in2)
##D nphen(dl.in2)
##D nmrk(dl.in2)
## End(Not run)



