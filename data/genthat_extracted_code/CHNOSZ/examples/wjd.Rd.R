library(CHNOSZ)


### Name: wjd
### Title: Gibbs Energy Minimization by Steepest Descent
### Aliases: wjd element.potentials is.near.equil guess run.wjd run.guess
###   equil.potentials

### ** Examples
## Don't show: 
data(thermo)
## End(Don't show)
## run the function with default settings to reproduce
## the example problem in White et al., 1958
w <- wjd()
# the mole fractions are very close to those shown in the
# last column of Table III in the paper
print(w$X)
# the Gibbs energy of the system decreased, 
# and by a smaller amount, at each iteration
print(diff(w$F.Y))
# there are 76 unique combinations of species that can be
# used to calculate the chemical potentials of the elements
stopifnot(nrow(invertible.combs(w$A))==76)
# what the scatter in those chemical potentials looks like
## Don't show: 
opar <- par(no.readonly=TRUE)
## End(Don't show)
ep <- element.potentials(w, plot.it=TRUE)
# the differences in chemical potentials / RT are all less than 0.01
is.near.equil(w)  # TRUE

## run the algorithm for only one iteration
w <- wjd(imax=1)
# the scatter in chemical potentials is much greater
ep <- element.potentials(w, plot.it=TRUE)
# and we're pretty far from equilibrium
is.near.equil(w)  # FALSE
## Don't show: 
par(opar)
## End(Don't show)

## test all of the guesses of inititial mole quantities
## provided by guess() using default bulk composition (H2NO)
# 9 of them are not is.near.equil with the tolerance lowered to 0.0001
sapply( 1:32, function(i) 
  is.near.equil(wjd(Y=guess(method = "stoich", iguess=i)), tol=0.0001) )

## using run.wjd(): 20 crystalline amino acids
iaa <- info(aminoacids(""), "cr")
# starting with one mole of each amino acid
w <- run.wjd(iaa, Y=rep(1, 20), imax=20)
# the following is TRUE (FALSE if tol is left at default)
is.near.equil(w, tol=0.012)
# in this assemblage, what are the amino acids 
# in order of increasing abundance?
aminoacids()[order(w$X)]
# because the elements are redistributed among the species,
# the total number of moles of species does not remain constant
sum(w$X)  # <20



