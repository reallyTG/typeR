library(sensiPhy)


### Name: intra_influ_phylm
### Title: Interaction between intraspecific variability and influential
###   species - Phylogenetic Linear Regression
### Aliases: intra_influ_phylm

### ** Examples

## Not run: 
##D # Load data:
##D data(alien)
##D # run analysis:
##D intra_influ <- intra_influ_phylm(formula = gestaLen ~ adultMass, phy = alien$phy[[1]],
##D data=alien$data,model="lambda",y.transf = log,x.transf = NULL,Vy="SD_gesta",Vx=NULL,
##D n.intra=30,distrib = "normal")
##D summary(intra_influ)
##D sensi_plot(intra_influ)
## End(Not run)
## Don't show: 
data(alien)
# run analysis:
intra_influ <- intra_influ_phylm(formula = gestaLen ~ adultMass, phy = alien$phy[[1]],
                                data=alien$data[1:15, ],model="lambda",y.transf = log,
                                x.transf = NULL,Vy="SD_gesta",Vx=NULL,
                                n.intra=5,distrib = "normal")
summary(intra_influ)
sensi_plot(intra_influ)
## End(Don't show)



