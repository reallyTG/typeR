library(phyreg)


### Name: phyreg
### Title: Performs a phylogenetic regression
### Aliases: phyreg
### Keywords: linear model comparative data

### ** Examples

## First get some data
data(myd0,myd1, myd2, myd3, extax)
## Then do our first analysis
phyreg(y~X1,"A",myd0,taxmatrix=extax)
## and test instead for "B", noticing that only the changed parameter need be given
phyreg(test="B")
## and we do more complicated analysis involving an interaction with an existing term
phyreg(y~X1+X2,"A*X1")
## Now we choose to see the output relating to rho and to how the degrees of freedom are determined,
##   and we also wish to see the means for each variable, and the parameters from the long 
##   regression on control+test variables
phyreg(oprho=6, opdf=1, means=1,parmxz=1)
## To illustrate inf, we store the results of an analysis in m1
m1<-phyreg(y~A,"X1+X2")
## Note we still get the extra output from the previous call, because those parameters 
##   too are remembered within a session. But we can see it again, whether or not we
##   saw it the first time, with inf. inf reminds you if you forget quite how to use it
inf()
inf(m1)
inf(m1,oppf=3)
inf(m1,oppf=7, oprho=5)
inf(m1, oppf=5, "means", "parmx")
inf(m1,"sinputs","lmshortx")
## The final call asks for things m1 doesn't have because it wasn't stored at the time. Now
##  we turn to changing the default parameters with new_default and factory_default. The help 
##  pages for those functions explain that only minor parameters (those affecting output and
##  storage, and those affecting rho), and not the models or the data-bearing parameters, have
##  default values.
new_default()
## This call takes the most recent parameters to phyreg and makes them the default, which
##   in the first instance changes nothing. But if we later call reset=TRUE as an argument
##   of phyreg, it is the values at the time of calling new_default() that will be returned
##   to. In this instance, we would automatically get output on rho and degrees
##   of freedom, and the means and xz parameters printed).
##   
##   To see this in operation, we would change those parameters...
phyreg(oprho=0,opdf=0,means=0,parmxz=0)
##   ... and then in the next call use reset=1. That will restore the defaults, which we changed
##   with new_default. To change the defaults back to the values that shipped with the
##   package, 
factory_default()
##   does the job.
##
## Finally, the phylogeny has so far been determined by a data frame of taxonomic variables in the
##   argument taxmatrix. If we have the phylogeny available in newick style, we can convert to 
##   the internal format, and then use that instead. Fortunately, one is provided. Note it is
##   good form to unset the other method of specifying a phylogeny (which is being remembered by
##   the package) with taxmatrix=NULL
data(newickstr)
z<-phyfromnewick(text=newickstr)
phyreg(phydata=z$phy,taxmatrix=NULL)
##   ... and if branch lengths were supplied, and we trust them, we can
phyreg(y~X1, "A", phydata=z$phy, heightsdata=z$hts)
##  Similarly with a phylogeny in phylo format. We obtain one of those by using the "phylo"
##    value from phyfromnewick, and use an intermediate variable"phyloobject" to show how
##    to use one if you have one
phyloobject<-z$orphylo
phyconverted<-phyfromphylo(phyloobject)
phyreg(phydata=phyconverted$phy)
phyreg(phydata=phyconverted$phy, heightsdata=phyconverted$hts)
## The results should all be the same because it's the same phylogeny represented in three
##   different ways, with the same heights.
##
## Enjoy!



