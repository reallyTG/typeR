library(fam2r)


### Name: conditionalLR
### Title: Simulates marker data on pedigrees conditionally on typed
###   individuals and calculates likelihoods
### Aliases: conditionalLR LRwrap label2num removePersons

### ** Examples

# Example
# Computational details for (currently) Example 1 of Kling et al (2017) are provided.
# The purpose is to explain the code and also check results against exact formulae and compare
# to a previous implementation, i.e., library(famr). # There is one marker with alleles 1, 2 
# and 3 having frequencies p1, p2, and p3. # We diregard complicating factors like mutation 
# (see next example), # and silent alleles. # One person, the grandmother GM, is genotyped as 1/1. 
# The grandson GS is to be simulated.

# The dataset 'grandmother' loaded below is a list with three components explained
# in the documentation of FamiliasPosterior, i.e, pedigrees, datamatrix and loci.
# The paramlink function 'Familias2linkdat' converts from 'Familias' format to a format
# suitable for plotting and conditional simulation, likelihood calculations etc, 
# using 'paramlink'; below 'plotPedList' is used to plot.

data(grandmother)
pedigrees = grandmother$pedigrees
datamatrix = grandmother$datamatrix
loci = grandmother$loci
persons = rownames(datamatrix)
## Not run: 
##D # Plot with newdev=TRUE, resize plot window and then plot with newed=FALSE
##D x = Familias2linkdat(pedigrees, datamatrix, loci)
##D plotPedList(x, newdev=TRUE, frametitles=c("H1", "H2"), 
##D   available ="shaded", marker=1, skip.empty.genotypes = TRUE)
## End(Not run)
# In this case there are two (=length(pedigrees)) 
# hypotheses H1 and H2  or equivalently two pedigrees.
# We will be interested in the likelihood ratio (LR) defined by Pr(data|H1)/Pr(data|H2) 
# or rather the random variables LR(H1) and LR(H2) where  H1 and H2 indicate the true hypotheses.
# In other words, we estimate the distribution of LR(H1) by simulating assuming H1 to be true
# and similarly for H2. Obviously, we also condition on genotyped individuals, GM in this case.
# Assume first H1 to be true. Then, as explained in the Kling et al. (2017), 
# there are three possible values for the likelihood ratios, 
# namely y1=1/2, y2=0.5+1/(4*p1), and y3=0.5+0.5/p1
# occuring with the probabilities py1, py2 and py3 calculated below

p = loci[[1]]$alleles
p1 = p[1]; p2=p[2]; p3=p[3]
py2 = (1-p1)*(p1+0.5)
py3 = 0.5*p1*(1+p1)
py1 =1-py2-py3
y1 = 0.5; y2 = 0.5+1/(4*p1); y3 =0.5+0.5/p1; LRs = c(y1, y2, y3)
LR.H1.exact = c(py1,py2,py3)
names(LR.H1.exact) = paste(LRs)

# The above probability distribution, LR.H1.exact, can be approximated by simulation,
# using 'markerSim' followed by likelihood calculation in 'Familias' or 'paramlink'.

Nsim = 5; seed = 17; avail = "GS"
res1 = conditionalLR(Nsim=Nsim, datamatrix, loci, pedigrees, available=avail,
                     seed=seed, program = "Familias", simplify=TRUE)
res2 = conditionalLR(Nsim=Nsim, datamatrix, loci, pedigrees, available=avail,
                     seed=seed, program = "paramlink",  simplify=TRUE) #Change

LR.H1.Familias = table(res1[,1])/Nsim 
LR.H1.paramlink = table(res2[,1])/Nsim
stopifnot(round(LR.H1.Familias-LR.H1.paramlink,12)==0)
# We see that the two implementations give the same result and agree well
# with the theoretical result. The previous implementation also agrees well.
## Not run: 
##D   #Try old code
##D   install.packages("http::/familias.name/famr_1.0-zip")
##D   library(famr)
##D   res3 <- conditionalSimulationWrite(nsim = Nsim, datamatrix, persons, 
##D     loci, pedigrees, available = 3, seed = 1482659436, ref = 2, file = NULL)
##D   LR.H1.old = table(res3[,1])/Nsim
##D   LR.H2.old = table(res3[,2])/Nsim
##D   # The above code is limited in some respects: It assumes 
##D   # that there are two pedigrees and that there
##D   # are no mutations. With ref=2, H2 is the denominator of the LR. Column 1 of the output,
##D   # res3[,1] above is simulated assumed H1 to be true, res[,2] assuming H2 to be true.
## End(Not run)

# Consider next simulation under H2 calculated for H2
LR.H2.Familias = table(res1[,2])/Nsim 
LR.H2.paramlink = table(res2[,2])/Nsim 
stopifnot(round(LR.H2.Familias-LR.H2.paramlink,12)==0)

# Obviously, the possible values for LR are the same for H1 and H2.
# Note that the largest value of LR occurs with probability py3=p1^2= 1e-04
# This value may not be reached in the simulations. Again results agree well and
# also with the previous implementation if Nsim=1000. The probability distribution of LR 
# conditionally on H2 is calculated as

py3 = p1^2
py1 = (1-p1)^2
py2 = 2*p1*(1-p1)
LR.H2.exact = c(py1,py2,py3)
names(LR.H2.exact) = paste(LRs)

# The previous example continues, but we will now 
# model mutations and for simplicity assume a SNP marker. 
## Not run: 
##D # Let the mutation rate be 0.05
##D # The mutation rate is chosen (too) high to see some impact.
##D # in a 'proportional mutation model, i.e.,
##D p = c(0.2, 0.8); R=0.05
##D loci = list(FamiliasLocus(p, 1:2, "L1", MutationModel = "Proportional",
##D                           MutationRate=R))
##D x = Familias2linkdat(pedigrees[[1]], datamatrix, loci)
##D m = marker(x,  1, c(1,1), alleles=1:2, afreq=p)
##D x = addMarker(x,m)
##D p.GS = oneMarkerDistribution(x, 3, partialmarker=1, verbose = FALSE)
##D # For instance
##D p22.one = p.GS["2/2"]
##D # is the probability of the grandson being 2/2 when
##D # the grandmother is 1/1; without mutation this would be
##D p22.ind = 0.5*p[2]^2
##D # We next check the exact result by an exact formula 
##D # Egeland, Pinto and Amorim (2017, submitted) and also
##D # using simulation. Let
##D H = 1-sum(p^2); k = R/H
##D p22 = 0.5*p[2]^2*(2-(1-k)^2) # LR = 0.5+0.5*(1-(1-k)^2) with  
##D stopifnot(round(p22.one-p22, 10)==0)
##D # probability p22. Below we simulate to check
##D Nsim = 1000; seed=177
##D res = conditionalLR(Nsim=Nsim, datamatrix, loci, pedigrees, available="GS",
##D   seed=seed, program = "Familias", verbose = FALSE, simplify=TRUE)
##D LR.H1.mut = table(res[,1])/Nsim 
##D (LR.H1.mut[1]-p22)/p22 #relative difference
## End(Not run)

# Example  Missing grandchild example
## Not run: 
##D  #Takes 3-4 minutes
##D   data(F21)
##D   pedigrees = F21$pedigrees
##D   datamatrix = F21$datamatrix
##D   loci = F21$loci
##D   persons = rownames(datamatrix)
##D   x = Familias2linkdat(pedigrees, datamatrix, loci) 
##D   Nsim = 1000
##D   res1 = conditionalLR(Nsim = Nsim, datamatrix,  loci, pedigrees, program ="Familias",
##D                               available = "Missing Person", seed=17, verbose = FALSE, simplify=TRUE)
##D   LR = data.frame(LR.H1=res1[,1], LR.H2=res1[,2])
##D   length(LR[,1][LR[,1]>10^5])/Nsim
##D   length(LR[,2][LR[,2]==0])/Nsim #PE estimate
##D   res1 = FamiliasConditional(Nsim = Nsim, datamatrix,  loci, pedigrees,
##D                               available = "Missing Person", seed=17)
##D                               
##D   res2 = conditionalLR(Nsim = Nsim, datamatrix,  loci, pedigrees, program ="Familias",
##D                        available = "Missing Person", seed=17, verbose = FALSE)
##D   res = cbind(res1[[1]][,1], res2[,,1][,1])
##D   
##D   boxplot(log(res)); title ("log LR(H1), Familias and paramlink (right)")
## End(Not run)

## Not run: 
##D # Example
##D data(Demo3Markers)
##D pedigrees = Demo3Markers$pedigrees
##D datamatrix = Demo3Markers$datamatrix
##D loci = Demo3Markers$loci
##D persons = rownames(datamatrix)
##D Nsim = 5
##D res.Familias = conditionalLR(Nsim = Nsim, datamatrix,  loci, pedigrees, 
##D                               file = NULL, program = "Familias", truePed = NULL, 
##D                               available = "Mother", ref=NULL, seed=177, simplify = TRUE)
##D res.paramlink = conditionalLR(Nsim = Nsim, datamatrix,  loci, pedigrees, 
##D                               file = NULL, program = "paramlink", truePed = NULL, 
##D                               available = "Mother", ref=NULL, seed=177, simplify=TRUE)
##D 
##D # Always the same LR as the probabilities of the genotypes of the person simulated ("Mother") 
##D # is the same for both hypotheses:
##D stopifnot(round(res.Familias[,1]-res.paramlink[1,1],12)==0)
##D stopifnot(round(res.Familias[,2]-res.paramlink[1,2],12)==0)
##D 
##D # Example 
##D data(symmetric)
##D pedigrees = symmetric$pedigrees
##D datamatrix = symmetric$datamatrix
##D loci = symmetric$loci
##D persons = rownames(datamatrix)
##D truePeds = 1:3
##D res.Familias = conditionalLR(Nsim = 5, datamatrix,  loci, pedigrees, 
##D                      file = NULL, program = "Familias", truePeds = truePeds, 
##D                      available = NULL, ref=2, seed=177, verbose = FALSE)
##D res.paramlink = conditionalLR(Nsim = 5, datamatrix,  loci, pedigrees, 
##D                    file = NULL, program = "paramlink", truePeds = truePeds, #Change
##D                    available = NULL, ref=2, seed=177, verbose = FALSE)
##D stopifnot(round(res.Familias[,,truePeds]-res.paramlink[,,truePeds],12)==0)
##D 
##D # Example 
##D ped = list(singleton(5,1), nuclearPed(2))
##D x = markerSim(ped, N=5, alleles=1:5, verbose=FALSE, available=5)
##D y = nuclearPed(3)
##D y2 = transferMarkerdata(x, y)
##D y2
## End(Not run)



