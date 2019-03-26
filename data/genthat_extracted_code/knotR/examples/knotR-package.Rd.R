library(knotR)


### Name: knotR-package
### Title: The knotR package
### Aliases: knotR-package knot-package
### Keywords: package

### ** Examples


a <- reader(system.file("7_6.svg",package="knotR"))
knotplot2(a)  # shows curvature

# Now use text=TRUE to display strand numbers so you can figure out the
# overunder relations:

knotplot2(a,text=TRUE,lwd=1)

ou76 <- matrix(c(
    12,01,
    02,11,
    07,03,
    04,15,
    16,06,
    14,08,
    10,13
    ),byrow=TRUE,ncol=2)

# Now we can do a proper knot plot:

knotplot(a,ou76)


# To symmetrize a knot we use the symmetry functionality of the knot:

a <- reader(system.file("3_1_not_symmetric.svg",package="knotR"))

knotplot2(a,seg=TRUE,text=TRUE,lwd=1,node=TRUE)

# First specify the vertical symmetry:
         
Mver <- matrix(c(
    08,10,
    07,11,
    02,04,
    01,05,
    12,06
    ),ncol=2,byrow=TRUE)

# Then the rotational symmetry:
Mrot <- matrix(c(
    09,05,01,
    10,06,02,
    08,04,12
    ),byrow=TRUE,ncol=3)


# Now the overunder information:
ou31 <- matrix(c(
    03,08,
    11,04,
    07,12
    ),byrow=TRUE,ncol=2)


# create a symmetry object:

sym31 <- symmetry_object(a, Mver=Mver,xver=c(9,3),Mrot=Mrot)   


knotplot(symmetrize(a,sym31),ou31)

# Symmetric-- but ugly as a burglar's bulldog.

# to beautify, either use the knotoptim() function, or do it by hand:


objective <- function(m) {badness(make_minobj_from_minsymvec(m, sym31))}
startval  <- make_minsymvec_from_minobj(as.minobj(a),sym31)

## Not run: 
##D # nlm() is the best optimization method, I think.  Limit to 1 iteration:
##D o <- nlm(f=objective, p=startval, iterlim=1)
##D 
##D # extract the evaluate:
##D oo <- make_minobj_from_minsymvec(o$estimate, sym31)
##D 
##D # create a knot:
##D k31_marginally_better <- 
##D knot(x = oo, overunderobj = ou31, symobj = sym31)
##D 
##D # then plot it:
##D knotplot(k31_marginally_better)
##D 
## End(Not run)



