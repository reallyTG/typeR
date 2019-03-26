## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.width=7, fig.align = 'center',
                      warning=FALSE, message=FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  install.packages('Bclim')

## ---- eval=FALSE---------------------------------------------------------
#  devtools::install_github('andrewcparnell/Bclim')

## ------------------------------------------------------------------------
library(Bclim)

## ---- results='hide'-----------------------------------------------------
library(Bchron)

# load in dates
Roya_dates = read.table(system.file("extdata", 
                                    "Roya.dat", 
                                    package = "Bclim"), 
                        header=TRUE)

# Load in the pollen depths
Roya_depths = read.table(system.file("extdata", 
                                     "Roya_pollen_depths.txt", 
                                     package = "Bclim"))

# Run Bchron
Roya_chron = with(Roya_dates,
                  Bchronology(ages=Age, 
                              ageSds=sd, 
                              positions=Depth, 
                              positionThickness=Thickness, 
                              id=id, 
                              predictPositions=Roya_depths$V1,
                              thin = 4))

## ------------------------------------------------------------------------
# Check convergence
summary(Roya_chron,type='convergence') # Good

## ------------------------------------------------------------------------
# Plot
plot(Roya_chron,xlab='Age (cal BP)',ylab='Depth (cm)',main='Laguna de la Roya',las=1)

## ---- results='hide'-----------------------------------------------------
# Load in the pollen data
Roya_pollen = read.table(system.file("extdata",
                                    "Roya_pollen.txt",
                                    package = "Bclim"),
                        header=TRUE)

# Extract the chronologies - Bclim requires them in thousands of years
Roya_chronologies = Roya_chron$thetaPredict/1000

# Run the single slice climate clouds
Roya_slices = slice_clouds(Roya_pollen)

# Run the climate histories function
Roya_histories = climate_histories(slice_clouds = Roya_slices,
                              chronology = Roya_chronologies,
                              time_grid = seq(0,16,by=0.1))

## ------------------------------------------------------------------------
# Plot a single slice cloud if required - plot slice 50
par(mar=c(3,3,2,1), mgp=c(2,.7,0), tck=-.01,las=1)
plot(Roya_histories$slice_clouds,slice=50, dims=2:3, main='slice 50',xlab='MTCO',ylab='AET/PET',col=terrain.colors(30))

## ------------------------------------------------------------------------
# Plot the climate histories
par(mar=c(3,3,2,1), mgp=c(2,.7,0), tck=-.01,las=1)
plot(Roya_histories, most_representative = 3, chron=Roya_chronologies,xlab='Age (k cal years BP)',ylab='GDD5',main='Roya GDD5')
legend('topleft',legend=c('Slice clouds','Climate ribbon','Representative histories'),pch=15,col=c('blue','red','green'))

plot(Roya_histories,dim=2,most_representative = 3,chron=Roya_chronologies,xlab='Age (k cal years BP)',ylab='MTCO',main='Roya MTCO')
legend('bottomleft',legend=c('Slice clouds','Climate ribbon','Representative histories'),pch=15,col=c('blue','red','green'))

par(mar=c(3,3,2,1), mgp=c(2,.7,0), tck=-.01,las=1)
plot(Roya_histories,dim=3,most_representative = 3, chron=Roya_chronologies,xlab='Age (k cal years BP)',ylab='AET/PET',main='Roya AET/PET')
legend('bottomleft',legend=c('Slice clouds','Climate ribbon','Representative histories'),pch=15,col=c('blue','red','green'))

## ---- results='hide'-----------------------------------------------------
# Summarise the histories if required
summary(Roya_histories,dim=3)

## ------------------------------------------------------------------------
### Create the plot of first differences
# This might one day become a function in Bclim

# Somewhere to store the differences
diffs = vector('list',length=3)
clim_names = c('GDD5','MTCO','AET/PET')

# Loop through each climate dimension
for(i in 1:3) {
  diffs[[i]] = -apply(Roya_histories$histories[,,i],1,'diff')
}
diff_means = lapply(diffs,'rowMeans')
diff_sds = lapply(diffs,function(x) apply(x,1,'sd'))
diff_snr = lapply(mapply("/",diff_means,diff_sds,SIMPLIFY = FALSE),'abs')
df = data.frame(tg=rep(Roya_histories$time_grid[-1],3),
                diff_means=unlist(diff_means),
                diff_sds=unlist(diff_sds),
                SNR=unlist(diff_snr),
                clim_var=rep(clim_names,
                             each=length(Roya_histories$time_grid)-1))
df$clim_var = factor(df$clim_var,levels=clim_names,ordered=TRUE)

# Create the plot using ggplot2
library(ggplot2)
limits = aes(ymax = diff_means + diff_sds, ymin= diff_means - diff_sds)
p = ggplot(df,aes(x=tg,y=diff_means,colour=SNR)) + 
  geom_linerange(limits) + 
  geom_line(colour='black') +
  facet_grid(clim_var ~ .,scales='free_y')+ xlab('Age (k cal yrs BP)') + 
  ylab('First difference') + 
  ggtitle('Roya: centennial first difference means +/- 1 standard deviation') + 
  scale_x_continuous(breaks=seq(0,16,by=1))+theme_bw() + 
  geom_hline(aes(yintercept=0)) + 
  scale_colour_gradientn(colours=rev(heat.colors(3)))
print(p)

