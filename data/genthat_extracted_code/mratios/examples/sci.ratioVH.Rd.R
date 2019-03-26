library(mratios)


### Name: sci.ratioVH
### Title: Approximate simultaneous confidence intervals for ratios of
###   means when variances are heterogeneous
### Aliases: sci.ratioVH
### Keywords: htest

### ** Examples


data(Mutagenicity, package="mratios")

boxplot(MN~Treatment, data=Mutagenicity)

# Unless it is hard to assume Gaussian distribution
# in this example this is an attempt to take
# heterogeneous variances into account.

# Comparisons to the vehicle control,
# Proof of Hazard, using multiplicity adjusted 
# confidence intervals:

## Not run: 
##D 
##D sci.ratioVH(MN~Treatment, data=Mutagenicity,
##D  type="Dunnett", base=6, method="Plug")
##D 
##D 
##D # Unadjusted confidence intervals for an 
##D # intersection union test to proof safety
##D # for all doses of the compound.
##D 
##D sci.ratioVH(MN~Treatment, data=Mutagenicity,
##D  type="Dunnett", base=6, method="Unadj", alternative="less")
##D 
##D 
##D # # # # 
##D 
##D # User-defined contrasts:
##D 
##D # Mutagenicity of the doses of the new compound,
##D # expressed as ratio (DoseX-Vehicle)/(Cyclo25-Vehicle):
##D 
##D # Check the order of the factor levels:
##D 
##D levels(Mutagenicity$Treatment)
##D 
##D # numerators:
##D 
##D NC<-rbind(
##D "Hydro30-Vehicle"=c(0,0,1,0,0,-1),
##D "Hydro50-Vehicle"=c(0,0,0,1,0,-1),
##D "Hydro75-Vehicle"=c(0,0,0,0,1,-1),
##D "Hydro100-Vehicle"=c(0,1,0,0,0,-1)
##D )
##D 
##D DC<-rbind(
##D "Cyclo25-Vehicle"=c(1,0,0,0,0,-1),
##D "Cyclo25-Vehicle"=c(1,0,0,0,0,-1),
##D "Cyclo25-Vehicle"=c(1,0,0,0,0,-1),
##D "Cyclo25-Vehicle"=c(1,0,0,0,0,-1)
##D )
##D 
##D colnames(NC)<-colnames(DC)<-levels(Mutagenicity$Treatment)
##D 
##D NC
##D 
##D DC
##D 
##D 
##D 
##D CIs<-sci.ratioVH(MN~Treatment, data=Mutagenicity,
##D  Num.Contrast=NC,
##D  Den.Contrast=DC)
##D 
##D # # # #
##D 
##D # Unadjusted confidence intervals for multiple ratios
##D # of means assuming heterogeneous group variances.
##D # The following code produces the results given in Table
##D # V of Hasler, Vonk and Hothorn (2007).
##D # The upper confidence limits in Table V can produced
##D # by calling:
##D 
##D sci.ratioVH(formula=MN~Treatment, data=Mutagenicity,
##D  Num.Contrast=NC, Den.Contrast=DC,
##D  method="Unadj", alternative="less", conf.level=0.95)
## End(Not run)




