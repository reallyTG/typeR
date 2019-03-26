library(mratios)


### Name: simtest.ratioVH
### Title: Approximate simultaneous tests for ratios of normal means with
###   heterogeneous variances
### Aliases: simtest.ratioVH
### Keywords: htest

### ** Examples


###############################################

data(Mutagenicity, package="mratios")

boxplot(MN~Treatment, data=Mutagenicity)

## Not run: 
##D 
##D simtest.ratioVH(MN~Treatment, data=Mutagenicity,
##D  type="Dunnett", base=6, Margin.vec=1.2, alternative="less")
##D 
##D ###############################################
##D 
##D # Unadjusted confidence intervals for multiple ratios
##D # of means assuming heterogeneous group variances.
##D # The following code produces the results given in Table
##D # V of Hasler, Vonk and Hothorn (2007).
##D # The upper confidence limits in Table V can produced
##D # by calling:
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
##D # The raw p-values are those presented in Table V:
##D 
##D simtest.ratioVH(formula=MN~Treatment, data=Mutagenicity,
##D  Num.Contrast=NC, Den.Contrast=DC,
##D  alternative="less", Margin.vec=0.5, FWER=0.05)
## End(Not run)



