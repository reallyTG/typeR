library(knotR)


### Name: symmetrize
### Title: Symmetry and knots
### Aliases: symmetrize symmetrise force_nodes
###   force_nodes_exactly_horizontal force_nodes_exactly_vertical
###   force_nodes_mirror_images_LR force_nodes_mirror_images_UD
###   force_nodes_on_V_axis force_nodes_on_H_axis force_nodes_rotational
###   symmetrize tag_notneeded make_minsymvec_from_minobj
###   make_minobj_from_minsymvec symmetry_object minsymvec knot

### ** Examples


# each row of M = a pair of symmetrical nodes; each element of v is a
# node on the vertical axis

M <- matrix(c(6,4,13,11,7,3,2,8,9,1,14,10),byrow=TRUE,ncol=2) 
v <-  c(5,12) # on vertical axis

sym_7_3 <- symmetry_object(k7_3, M, v)

k <- symmetrize(as.minobj(k7_3), sym_7_3)

knotplot2(k)  #nice and symmetric!


## OK now convert to and from a mimimal vector for a symmetrical knot:

mii <- make_minsymvec_from_minobj(k, sym_7_3)
pii <- make_minobj_from_minsymvec(mii,sym_7_3)
knotplot2(pii)


##   So 'mii' is a minimal vector for a symmetrical knot, and 'pii' is
##   the corresponding minobj object.  Note that you can mess about with
##   mii, but whatever you do the resulting knot is still symmetric:

mii[2] <- 1000
knotplot2(make_minobj_from_minsymvec(mii,sym_7_3))   # still symmetric.

## and, in particular, you can optimize the badness, using nlm():

## Not run: 
##D fun <- function(m){badness(make_minobj_from_minsymvec(m,sym_7_3))}
##D o <- nlm(fun,mii,iterlim=4,print.level=2)
##D 
##D knotplot2(make_minobj_from_minsymvec(o$estimate,sym_7_3))
## End(Not run)





