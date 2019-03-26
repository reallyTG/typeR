library(BCellMA)


### Name: targeting_motive_plot
### Title: Polt of the difference at three positions before and after a
###   mutation to identify the hotspot motifs.
### Aliases: targeting_motive_plot

### ** Examples

data(IMGTtab2)
data(IMGTtab7)
germline<-germlineReconstr(IMGTtab2$V_REGION, IMGTtab7$V_REGION)
data<-targetingMatrix(data_tab2=IMGTtab2, data_tab_germline=germline, data_tab7=IMGTtab7)
targeting_motiv_data<-targeting_motiv(data)
targeting_motive_plot(targeting_motiv_data$A, xfontsize = 15, yfontsize = 15, xlim=60 )




