library(covatest)


### Name: sepindex-class
### Title: Class "sepindex"
### Aliases: sepindex-class sepindex boxplot,sepindex-method
###   sepindex-method show,sepindex-method [,sepindex-method
###   summary,sepindex-method

### ** Examples

# --start define the STFDF rr_13-- #
library(sp)
library(spacetime)
library(gstat)
data(air)
ls()
if (!exists("rural")) rural = STFDF(stations, dates, data.frame(PM10 =
as.vector(air)))
rr = rural[,"2005::2010"]
unsel = which(apply(as(rr, "xts"), 2, function(x) all(is.na(x))))
r5to10 = rr[-unsel,]
rr_13 <- r5to10[c("DEHE046","DESN049","DETH026","DENW063","DETH061","DEBY047",
"DENW065","DEUB029","DENW068","DENI019","DEHE051","DERP016","DENI051"),
"2005::2006"]
# --end define the STFDF rr_13-- #

#compute the Global Sill
C00_13<-var(rr_13[,,"PM10"]@data[[1]], na.rm = TRUE)

#estimate the spatio-temporal variogram
data(vv_13)
nonsep.index<-sepindex(vario_st = vv_13, nt = 16, ns = 4, globalSill = C00_13)

##methods for sepindex

#1. show
nonsep.index

#2. summary
summary(nonsep.index)

#3. boxplot
boxplot(nonsep.index, ylab="Non-separability ratio")

#4. [ extract
nonsep.index[1:8, ] #selection of the first 8 rows
nonsep.index[1:8, 1:2] #selection of the first 2 columns



