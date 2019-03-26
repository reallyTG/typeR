library(covatest)


### Name: vv_13
### Title: Precomputed variogram for PM10 in data set air
### Aliases: vv_13
### Keywords: StVariogram dataset,

### ** Examples

# --start define the STFDF rr_13-- #
library(sp)
library(spacetime)
library(gstat)

data(air)

ls()

if (!exists("rural")) rural = STFDF(stations, dates, data.frame(PM10 =
as.vector(air)))

rr <- rural[,"2005::2010"]

unsel = which(apply(as(rr, "xts"), 2, function(x) all(is.na(x))))

r5to10 = rr[-unsel,]

rr_13 <- r5to10[c("DEHE046","DESN049","DETH026","DENW063","DETH061","DEBY047",
"DENW065","DEUB029","DENW068","DENI019","DEHE051","DERP016","DENI051"),
"2005::2006"]
# --end define the STFDF rr_13-- #


## To run the example, paste and copy the following lines
# (without the symbol '#') in the console:
#
# vv_13 is obtained by running the following command line:
#
# vv_13 <- variogram(PM10~1, rr_13, width=60, cutoff = 220, tlags=0:15)
## End (Not run)



