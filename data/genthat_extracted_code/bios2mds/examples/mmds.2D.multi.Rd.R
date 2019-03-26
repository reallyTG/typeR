library(bios2mds)


### Name: mmds.2D.multi
### Title: Plots the mmds coordinates onto a 2D space
### Aliases: mmds.2D.multi
### Keywords: plot

### ** Examples

# scatter plot of human GPCRs onto the first two axes obtained
# from MDS analysis with projection of GPCRs from N.vectensis 
# and C.intestinalis as supplementary elements:
data(gpcr)

mmds_human <- gpcr$mmds$sapiens.active
project_vectensis <-gpcr$mmds$vectensis.project
project_intestinalis <-gpcr$mmds$intestinalis.project

mmds.2D.multi(mmds_human,project=list(project_vectensis,project_intestinalis),
bary='l',cex.axis=0.01,active.cex = 1, sup.cex = 1,active.lwd=1.5,sup.lwd=3,
ensemble.legend.name=c('nemve','inte','human'),legend=FALSE,title='multi_human')

# with selected group

mmds.2D.multi(mmds_human,project=list(project_vectensis,project_intestinalis),
bary='l',cex.axis=0.01,active.cex = 1, sup.cex = 1,active.lwd=1.5,sup.lwd=3,
ensemble.legend.name=c('nemve','inte','human'),legend=FALSE,title='multi_human',
group.name=c('SO','PEP','OPN','ADENO'),group.col=c("red","forestgreen","orange","maroon"))




