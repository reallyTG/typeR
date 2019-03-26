library(LakeMetabolizer)


### Name: k600.2.kGAS
### Title: Returns the gas exchange velocity for gas of interest w/ no unit
###   conversions
### Aliases: k600.2.kGAS k600.2.kGAS.base

### ** Examples

 ## single example
kO2 <- k600.2.kGAS.base(k600=2.4,temperature=20.4,gas='O2')

## Timeseries example
#load data
data.path = system.file('extdata', package="LakeMetabolizer")
sp.data = load.all.data('sparkling', data.path)
ts.data = sp.data$data #pull out just the timeseries data


#calculate U10 and add it back onto the original 
u10 = wind.scale(ts.data)
ts.data = rmv.vars(ts.data, 'wnd', ignore.offset=TRUE) #drop old wind speed column
ts.data = merge(ts.data, u10)                          #merge new u10 into big dataset  

k600 = k.cole(ts.data)
ts.data = merge(k600, ts.data)

k.gas = k600.2.kGAS(ts.data, 'O2')



