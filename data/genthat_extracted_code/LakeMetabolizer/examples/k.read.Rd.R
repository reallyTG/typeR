library(LakeMetabolizer)


### Name: k.read
### Title: Returns a timeseries of gas exchange velocity
### Aliases: k.cole k.crusius k.heiskanen k.macIntyre k.read
###   k.read.soloviev k.vachon
### Keywords: math methods

### ** Examples

data.path = system.file('extdata', package="LakeMetabolizer")

tb.data = load.all.data('sparkling', data.path)

ts.data = tb.data$data #pull out just the timeseries data

#calculate U10 and add it back onto the original 

u10 = wind.scale(ts.data)
ts.data = rmv.vars(ts.data, 'wnd', ignore.offset=TRUE) #drop old wind speed column
ts.data = merge(ts.data, u10)                          #merge new u10 into big dataset  


k600_cole = k.cole(ts.data)

k600_crusius = k.crusius(ts.data)

kd        = tb.data$metadata$averagekd
wnd.z      = 10   #because we converted to u10
atm.press  = 1018
lat       = tb.data$metadata$latitude
lake.area = tb.data$metadata$lakearea

#for k.read and k.macIntyre, we need LW_net. 
#Calculate from the observations we have available. 

lwnet = calc.lw.net(ts.data, lat, atm.press)
ts.data = merge(ts.data, lwnet)
## Not run: 
##D k600_read = k.read(ts.data, wnd.z=wnd.z, Kd=kd, atm.press=atm.press, 
##D lat=lat, lake.area=lake.area)
##D 
##D k600_soloviev = k.read.soloviev(ts.data, wnd.z=wnd.z, Kd=kd, 
##D atm.press=atm.press, lat=lat, lake.area=lake.area)
##D 
##D k600_macIntyre = k.macIntyre(ts.data, wnd.z=wnd.z, Kd=kd, atm.press=atm.press)
## End(Not run)



