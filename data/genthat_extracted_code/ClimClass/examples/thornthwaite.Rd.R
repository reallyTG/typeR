library(ClimClass)


### Name: thornthwaite
### Title: Thornthwaite and Mather's water balance
### Aliases: thornthwaite

### ** Examples


data(Trent_climate)


# lista_cli is a list of data frames of the type "series", 
# each one referring to one station - see function "climate".
# clima_81_10 is a list of data frames having climatic means 
# of temperature and precipitation, each one referring to one station. 
# It can be the output of function "climate".
library(geosphere) # required for function daylength
thornt_lst<-NULL
lista_cli <- lista_cli[1:3] ## lista_cli is reduced to diminish elapsed time of execution!
for(k in 1 : length(lista_cli[1:3])) {
  thornt_lst[[k]]<-thornthwaite(series=lista_cli[[k]], 
  clim_norm=clima_81_10[[k]],
  latitude = 46, first.yr=1981, 
  last.yr=2010, snow_melt_coeff=c(0.5,0.5 )  )
}
names(thornt_lst)<-names(lista_cli)
  
# splits list into two lists
W_balance<-NULL; quantiles<-NULL
for(k in 1 : length(lista_cli))
{
  W_balance[[k]]<-thornt_lst[[k]]$W_balance
  quantiles[[k]]<-thornt_lst[[k]]$quantiles
 }
 names(W_balance)<-names(thornt_lst); names(quantiles)<-names(thornt_lst)
 



