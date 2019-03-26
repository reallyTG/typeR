library(mratios)


### Name: sci.ratio
### Title: Simultaneous confidence intervals for ratios of linear
###   combinations of means
### Aliases: sci.ratio sci.ratioI
### Keywords: htest

### ** Examples



# # #

# A 90-days chronic toxicity assay: 
# Which of the doses (groups 2,3,4) do not show a decrease in
# bodyweight more pronounced than 90 percent of the bodyweight
# in the control group?

data(BW)

boxplot(Weight~Dose,data=BW)

BWnoninf <- sci.ratio(Weight~Dose, data=BW, type="Dunnett",
 alternative="greater")

plot(BWnoninf, rho0=0.9)

## Not run: 
##D # # #
##D 
##D # Antibiotic activity of 8 different strains of a micro organisms.
##D # (Horn and Vollandt, 1995): 
##D 
##D data(Penicillin)
##D 
##D boxplot(diameter~strain, data=Penicillin)
##D 
##D allpairs<-sci.ratio(diameter~strain, data=Penicillin, type="Tukey")
##D plot(allpairs)
##D summary(allpairs)
##D 
## End(Not run)




