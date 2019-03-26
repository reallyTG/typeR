library(BCellMA)


### Name: targeting_motiv
### Title: Function to calculate the difference at three positions before
###   and after a mutation to identify the hotspot motifs
### Aliases: targeting_motiv

### ** Examples

data(IMGTtab2)
data(IMGTtab7)
germline<-germlineReconstr(IMGTtab2$V_REGION, IMGTtab7$V_REGION)
data<-targetingMatrix(data_tab2=IMGTtab2, data_tab_germline=germline, data_tab7=IMGTtab7)
targeting_motiv_data<-targeting_motiv(data)
targeting_motiv_data



