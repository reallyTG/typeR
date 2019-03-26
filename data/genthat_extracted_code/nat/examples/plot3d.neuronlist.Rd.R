library(nat)


### Name: plot3d.neuronlist
### Title: 3D plots of the elements in a neuronlist, optionally using a
###   subset expression
### Aliases: plot3d.neuronlist plot3d.character

### ** Examples

open3d()
plot3d(kcs20,type=='gamma',col='green')
## No test: 
clear3d()
plot3d(kcs20,col=type)
plot3d(Cell07PNs,Glomerulus=="DA1",col='red')
plot3d(Cell07PNs,Glomerulus=="VA1d",col='green')
# Note use of default colour for non DA1 neurons
plot3d(Cell07PNs,col=Glomerulus, colpal=c(DA1='red', 'grey'))
# a subset expression
plot3d(Cell07PNs,Glomerulus%in%c("DA1",'VA1d'),
  col=c("red","green")[factor(Glomerulus)])
# the same but not specifying colours explicitly
plot3d(Cell07PNs,Glomerulus%in%c("DA1",'VA1d'),col=Glomerulus)
## End(No test)
## Not run: 
##D ## more complex colouring strategies for a larger neuron set
##D # see https://github.com/jefferis/frulhns for details
##D library(frulhns)
##D # notice the sexually dimorphic projection patterns for these neurons
##D plot3d(jkn,cluster=='aSP-f' &shortGenotype=='JK1029', 
##D   col=sex,colpal=c(male='green',female='magenta'))
##D 
##D ## colour neurons of a class by input resistance
##D jkn.aspg=subset(jkn, cluster=='aSP-g')
##D # NB this comes in as a factor
##D Ri=with(jkn.aspg,as.numeric(as.character(Ri..GOhm.)))
##D # the matlab jet palette
##D jet.colors<-colorRampPalette(c('navy','cyan','yellow','red'))
##D plot3d(jkn.aspg,col=cut(Ri,20),colpal=jet.colors)
## End(Not run)



