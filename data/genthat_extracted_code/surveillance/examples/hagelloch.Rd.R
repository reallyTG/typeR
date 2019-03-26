library(surveillance)


### Name: hagelloch
### Title: 1861 Measles Epidemic in the City of Hagelloch, Germany
### Aliases: hagelloch hagelloch.df
### Keywords: datasets

### ** Examples

data("hagelloch")

head(hagelloch.df)   # original data documented in Oesterle (1992)
head(as.data.frame(hagelloch))   # derived "epidata" object


### How the "epidata" 'hagelloch' was created from 'hagelloch.df'

stopifnot(all.equal(hagelloch,
  as.epidata(
    hagelloch.df, t0 = 0, tI.col = "tI", tR.col = "tR",
    id.col = "PN", coords.cols = c("x.loc", "y.loc"),
    f = list(
        household    = function(u) u == 0,
        nothousehold = function(u) u > 0
    ),
    w = list(
        c1 = function (CL.i, CL.j) CL.i == "1st class" & CL.j == CL.i,
        c2 = function (CL.i, CL.j) CL.i == "2nd class" & CL.j == CL.i
    ),
    keep.cols = c("SEX", "AGE", "CL"))
))


### Basic plots produced from hagelloch.df

# Show case locations as in Neal & Roberts (different scaling) using
# the data.frame (promoted to a SpatialPointsDataFrame)
coordinates(hagelloch.df) <- c("x.loc","y.loc")
plot(hagelloch.df, xlab="x [m]", ylab="x [m]", pch=15, axes=TRUE,
     cex=sqrt(multiplicity(hagelloch.df)))

# Epicurve
hist(as.numeric(hagelloch.df$tI), xlab="Time (days)", ylab="Cases", main="")


### SIR model information for population & individuals

(s <- summary(hagelloch))
plot(s, col=c("green","red","darkgray"))
stateplot(s, id=c("187"))

## Not run: 
##D   # Show a dynamic illustration of the spread of the infection
##D   animate(hagelloch,time.spacing=0.1,legend.opts=list(x="topleft"),sleep=1/100)
## End(Not run)



