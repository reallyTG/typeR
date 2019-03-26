library(wsyn)


### Name: set_adj
### Title: Set and get methods for classes in the 'wsyn' package
### Aliases: set_adj set_adj.default set_clusters set_clusters.default
###   set_modres set_modres.default set_mns set_mns.default set_coords
###   set_coords.default set_methodspecs set_methodspecs.default set_wmfs
###   set_wmfs.default set_wpmfs set_wpmfs.default get_adj get_adj.default
###   get_clusters get_clusters.default get_modres get_modres.default
###   get_mns get_mns.default get_coords get_coords.default get_methodspec
###   get_methodspec.default get_wmfs get_wmfs.default get_wpmfs
###   get_wpmfs.default set_coher set_coher.default set_dat1
###   set_dat1.default set_dat2 set_dat2.default set_norm set_norm.default
###   set_sigmethod set_sigmethod.default set_ranks set_ranks.default
###   set_bandp set_bandp.default get_coher get_coher.default get_dat1
###   get_dat1.default get_dat2 get_dat2.default get_norm get_norm.default
###   get_sigmethod get_sigmethod.default get_ranks get_ranks.default
###   get_bandp get_bandp.default setget_methods set_times
###   set_times.default set_timescales set_timescales.default set_values
###   set_values.default get_times get_times.default get_timescales
###   get_timescales.default get_values get_values.default set_coefs
###   set_coefs.default set_modval set_modval.default set_wts
###   set_wts.default get_coefs get_coefs.default get_modval
###   get_modval.default get_wts get_wts.default set_wlmobj
###   set_wlmobj.default set_drop set_drop.default get_wlmobj
###   get_wlmobj.default get_drop get_drop.default set_signif
###   set_signif.default get_signif get_signif.default set_dat
###   set_dat.default set_wtopt set_wtopt.default get_dat get_dat.default
###   get_wtopt get_wtopt.default

### ** Examples

times<-1:10
timescales<-1/c(1:10)
values<-matrix(1,length(times),length(timescales))
h<-tts(times,timescales,values)
get_times(h)




