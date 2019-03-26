## ----set-options,echo=FALSE---------------------------------------------------
options(width=80)

## ---- warning=FALSE-----------------------------------------------------------
library(EMbC)

## ---- fig.width=5, fig.height=4.0, fig.align='center'-------------------------
par(mgp=c(1.5, 0.4, 0), cex.lab=0.8, cex.axis=0.8)
plot(x2d@D, col=x2d@L, xlab='X1', ylab='X2')
# x2d@D is a matrix with the input data
# x2d@L is a numeric vector with the reference labelling

## -----------------------------------------------------------------------------
mybc <- embc(x2d@D)

## -----------------------------------------------------------------------------
slotNames(mybc)

## ---- fig.width=3.8, fig.height=3.0, fig.show='hold'--------------------------
# the lkhp() function allows an offset parameter;
lkhp(mybc)       # left panel
lkhp(mybc, 10)   # right panel

## -----------------------------------------------------------------------------
stts(mybc)

## -----------------------------------------------------------------------------
mybc@P[[1]]

## -----------------------------------------------------------------------------
mybc@R

## ---- fig.width=5, fig.height=2.5, fig.align='center'-------------------------
sctr(mybc)

## ---- fig.width=5, fig.height=4.8, fig.align='center'-------------------------
sctr(mybc, x2d@L)
# the top plot shows the clustering result;
# the bottom plot shows the reference labelling;

## -----------------------------------------------------------------------------
cnfm(mybc, x2d@L)

## -----------------------------------------------------------------------------
head(expth)

## -----------------------------------------------------------------------------
mybcp <- stbc(expth, info=-1)
# info=-1 supresses any step wise output information

## -----------------------------------------------------------------------------
slotNames(mybcp)

## -----------------------------------------------------------------------------
stts(mybcp)

## ---- fig.width=5, fig.height=3.0, fig.align='center'-------------------------
sctr(mybcp)

## -----------------------------------------------------------------------------
cnfm(mybcp)
# the expert labelling given in expth$lbl is used by default

## ---- fig.width=5, fig.height=3.5, fig.align='center'-------------------------
# lims=c(a, b) limits the plot to a chunk of the trajectory
lblp(mybcp, lims=c(100, 500))

## ---- fig.width=5, fig.height=3.5, fig.align='center'-------------------------
# this function allows a parameter lims=c(a,b) as well
view(mybcp, lims=c(100, 500))

## ---- eval=FALSE--------------------------------------------------------------
#  # point-wise kml doc generation;
#  # display=TRUE launches google-earth from within R;
#  pkml(bc, display=TRUE)

## ---- fig.width=5, fig.height=4.8, fig.align='center'-------------------------
# plotting time-spans, distances and heading directions;
# this is the default behavior when we just pass the binClstPath instance;
varp(mybcp)

## ---- fig.width=5, fig.height=3.5, fig.align='center'-------------------------
# plotting input data (estimated local values of velocity and turn);
varp(mybcp@X)

## ---- fig.width=5, fig.height=3.5, fig.align='center'-------------------------
# plotting certainties associated to each data-point (and input feature)
varp(mybcp@U)

## ---- message=FALSE, warning=FALSE--------------------------------------------
library(move)
data(leroy)

## ---- warning=FALSE-----------------------------------------------------------
# leroy is passed directly to the constructor
leroybc <- stbc(leroy, info=-1)

## -----------------------------------------------------------------------------
leroybc3 <- stbc(leroy, scv='height', info=-1)

## -----------------------------------------------------------------------------
stts(leroybc3)

## ---- fig.width=6, fig.height=3.5, fig.align='center'-------------------------
sctr(leroybc3, showVars=c(1, 2, 3))
# showVars=c(1,2,3) is the default option and it is only shown for illustrative purposes
# by default the background colour is set to light-grey to enhance visibility
# the "bg"" parameter allows changing this default behaviour

## ---- eval=FALSE--------------------------------------------------------------
#  sct3(leroybc3, showClst=c(5, 6, 7, 8))
#  # with showClst=c() we can restrict the plot to a particular subset of clusters

## -----------------------------------------------------------------------------
# dlta is the maximum likelihood difference to accept a relabelling
# dlta=1 (accept all changes) is the default behaviour
postbc3 <- smth(leroybc3, dlta=0.9)

## -----------------------------------------------------------------------------
# smth sets the smoothing time window length in hours
prebc3 <- stbc(leroy, smth=1, scv='height', info=-1)

## ---- fig.width=6, fig.height=3.5, fig.align='center'-------------------------
lblp(postbc3, smth(prebc3), lims=c(200, 600))
# of note:
# although performing a pre-smoothing, we can still aply a post-smoothing;
# there is no real need to instantiate the smoothed copy of prebc3;
# this is useful for saving memory in case of long trajectories;

## ---- eval=FALSE--------------------------------------------------------------
#  pkml(smth(prebc3), showClst=6, display=TRUE)

## -----------------------------------------------------------------------------
rlbl(prebc3, 6, 5)

## ---- fig.width=6, fig.height=3, fig.align='center'---------------------------
chkp(smth(prebc3), lims=c(200, 600))
# the solar height is the control variable used by default;
# note the relabelling we did before;

## ---- fig.width=3.2, fig.height=3.3, fig.show='hold'--------------------------
tmp <- runif(nrow(expth))
# simulated trajectory of individual 1
expth1 <- expth[which(tmp<=0.5), ]
# simulated trajectory of individual 2
expth2 <- expth[which(tmp>=0.5), ]

## -----------------------------------------------------------------------------
# we can combine data.fame trajectories and move objects
# only for illustrative purposes !!!
mystck <- stbc(list(expth1, expth2, leroy), info=-1)

## -----------------------------------------------------------------------------
stts(mystck)

## ---- fig.width=5, fig.height=3.5, fig.align='center'-------------------------
sctr(mystck)

## -----------------------------------------------------------------------------
cnfm(mystck)
# this will only work when expert labelling is given for all trajectories in the stack

## -----------------------------------------------------------------------------
slotNames(mystck)

## -----------------------------------------------------------------------------
class(mystck@bC)

## -----------------------------------------------------------------------------
class(mystck@bCS)

## -----------------------------------------------------------------------------
lapply(mystck@bCS, class)

## -----------------------------------------------------------------------------
bcInd1 <- slct(mystck,1)

## ---- fig.width=3.7, fig.height=3.2, fig.show='hold'--------------------------
sctr(slct(mystck, 1))  # left panel
sctr(slct(mystck, 3))  # right panel

## -----------------------------------------------------------------------------
# sctr(slct(mystck,1)) yields the same output as sctr(bcInd1) or sctr(mystck@bCS[[1]]);

## -----------------------------------------------------------------------------
cnfm(stbc(expth1, info=-1), slct(mystck, 1))
# stbc(expth1, info=-1) is the individual level clustering corresponding to individual 1;
# slct(mystck, 1) is the population level clustering corresponding to individual 1;

## ---- fig.width=6, fig.height=3.5, fig.align='center'-------------------------
lblp(slct(mystck, 1), slct(mystck, 2))

