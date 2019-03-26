library(directPA)


### Name: kinasePA
### Title: Direction Analysis for Kinases
### Aliases: kinasePA

### ** Examples


# load the phosphoproteomics dataset
data(HEK)

# load the kinase-substrate annoations
data(PhosphoSite)

# direction pathway analysis in 2-dimensional space. Implemented as rotating by degree 
# (1) test combined effect of Torin1 and Rapamycin vs insul both on "down-regulation"
# (180 degree to original direction)
kPA <- kinasePA(Tc=HEK, direction=pi, annotation=PhosphoSite.mouse)
kPA$kinase[order(unlist(kPA$kinase[,1])),][1:20,]
# rank substrates on the direciton of interest
sort(kPA$substrate.pvalues)[1:20]

# (2) test combined effect of Torin1 and Rapamycin vs insul on "no change and down-regulation"
# (135 degree to the original direction) 
kPA <- kinasePA(Tc=HEK, direction=pi*3/4, annotation=PhosphoSite.mouse)
kPA$kinase[order(unlist(kPA$kinase[,1])),][1:20,]

# (3) test combined effect of Torin1 and Rapamycin vs insul on "down-regulation and no change"
# (225 degree to the original direction) 
kPA <- kinasePA(Tc=HEK, direction=pi*5/4, annotation=PhosphoSite.mouse)
kPA$kinase[order(unlist(kPA$kinase[,1])),][1:20,]




