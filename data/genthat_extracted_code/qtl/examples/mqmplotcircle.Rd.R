library(qtl)


### Name: mqmplot.circle
### Title: Circular genome plot for MQM
### Aliases: mqmplot.circle
### Keywords: utilities

### ** Examples

data(multitrait)
## Don't show: 
multitrait$pheno <- multitrait$pheno[,1:3]
## End(Don't show)
data(locations)
## Don't show: 
locations <- locations[1:3,]
## End(Don't show)

multifilled <- fill.geno(multitrait)                    # impute missing genotypes
multicof <- mqmsetcofactors(multitrait,10)              # create cofactors
multiloc <- addloctocross(multifilled,locations)        # add phenotype information to cross
multires <- mqmscanall(multifilled,cofactors=multicof)  # run mqmscan for all phenotypes

#Basic mqmmulti, color = trait, round circle = significant
mqmplot.circle(multifilled,multires)

#mqmmulti with locations of traits in multiloc
mqmplot.circle(multiloc,multires)

#mqmmulti with highlighting
mqmplot.circle(multitrait,multires,highlight=3)

#mqmmulti with locations of traits in multiloc and highlighting
mqmplot.circle(multiloc,multires,highlight=3)



