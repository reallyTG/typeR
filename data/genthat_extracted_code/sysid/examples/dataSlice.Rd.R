library(sysid)


### Name: dataSlice
### Title: Subset or Resample idframe data
### Aliases: dataSlice

### ** Examples

data(cstr)
cstrsub <- dataSlice(cstr,start=200,end=400) # extract between indices 200 and 400
cstrTrain <- dataSlice(cstr,end=4500) # extract upto index 4500
cstrTest <- dataSlice(cstr,start=6501) # extract from index 6501 till the end
cstr_new <- dataSlice(cstr,freq=0.5) # resample data at half the original frequency  




