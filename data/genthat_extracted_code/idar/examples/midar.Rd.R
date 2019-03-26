library(idar)


### Name: midar
### Title: Customize the Individual Diversity-Area Relationship Function
### Aliases: midar
### Keywords: spatial

### ** Examples


data(SF)
data(SFphylotree)
 # Discard the size mark and keep the species mark in SF ppp:
  sfsp<- ppp(SF$x, SF$y, window=SF$window, marks=SF$marks$species)

# compute "individual Simpsom diversity-area relationship" around sp_44
# using function diversity from package vegan
require(vegan)
simpsom_sp_44<- midar(sfsp, mimark="sp_44", what =function(x) mean(diversity(x, "simpson")),
                                  r=1:15)


# test "individual Simpsom diversity-area relationship" against an inhomogeneous Poisson
# null modellfor sp_44. 
  # estimate intensityh surface for sp_44
   lambda<- density.ppp(unmark(sfsp[sfsp$marks=="sp_44"]), positive=TRUE)
  
  # generate 19 realizations of the null model, keeping all the other species fixed in their
  #  original coordinates.
   simulados<- multifocalsimulator(sfsp, mimark="sp_44", simulate=expression(rpoispp(lambda)),
                      nsim=19, nmin=15)

  # for simplicity define the function that we want to apply to each "local community"
  #  around each tree of sp_44
  mean_simpsom <- function(x) mean(diversity(x, "simpson"))

  # compute envelopes and plot them.
  simpsom_sp_44.env<-envelope(sfsp, midar, mimark="sp_44", what =mean_simpsom ,r=1:15,
                      nsim=19, simulate=simulados)
  plot(simpsom_sp_44.env)


# compute IPSVAR(r) "by hand"
   # first, check tree as would check it ipsvar
   arbol <- checktree(SFphylotree,  SF, "ipsvar", correct.phylo="exclude")

    # define function to obtain the averge psv from the set of local communities
    #  at each neigborhood radii r
     mipsv <- expression(mean(psv(x, tree=tree, compute.var=FALSE)$PSVs, na.rm=TRUE))
     # compute ipsvar "by hand" 
     sp_44_psv<- midar(sfsp, mimark="sp_44", tree=arbol, what =mipsv ,r=1:15)
     plot(sp_44_psv)

# compare it with the result of the built-in function
     plot(ipsvar(sfsp, mimark="sp_44", tree=arbol, r=1:15), add=TRUE, col="blue")
    



