library(BOIN)


### Name: plot.boin
### Title: Plot the flowchart and simulation results for BOIN designs
### Aliases: plot.boin

### ** Examples


###### single-agent trial ######

## get dose escalation and deescalation boundaries for conducting the trial
bound <- get.boundary(target=0.3, ncohort=10, cohortsize=3)
summary.boin(bound)
# plot.boin(bound)


## get the operating characteristics for BOIN single agent trial
oc <- get.oc(target=0.3, p.true=c(0.05,0.15,0.3,0.45,0.6),
   ncohort=10, cohortsize=3, ntrial=1000)
summary.boin(oc)
plot.boin(oc)
plot.boin(oc$selpercent)
plot.boin(oc$npatients)
plot.boin(oc$ntox)


## select the MTD based on the trial data
n <- c(3, 3, 15, 9, 0)
y <- c(0, 0, 4, 4, 0)
selmtd <- select.mtd(target=0.3, npts=n, ntox=y)
summary.boin(selmtd)
plot.boin(selmtd)


###### drug-combination trial ######

##### combination trial to find a single MTD  ######

## get the operating characteristics for BOIN combination trial
p.true <- matrix(c(0.01,0.03,0.10,0.20,0.30,
                0.03,0.05,0.15,0.30,0.60,
                0.08,0.10,0.30,0.60,0.75), byrow=TRUE, ncol=5)

oc.comb <- get.oc.comb(target=0.3, p.true, ncohort=20, cohortsize=3, n.earlystop=12,
     startdose=c(1,1),ntrial=100)
summary.boin(oc.comb)
plot.boin(oc.comb)
plot.boin(oc.comb$selpercent)
plot.boin(oc.comb$npatients)
plot.boin(oc.comb$flowchart)


## select a MTD based on the trial data
n <- matrix(c(3, 5, 0, 0, 0, 7, 6, 15, 0, 0, 0, 0, 4, 0, 0), ncol=5, byrow=TRUE)
y <- matrix(c(0, 1, 0, 0, 0, 1, 1, 4, 0, 0, 0, 0, 2, 0, 0), ncol=5, byrow=TRUE)
sel.comb <- select.mtd.comb(target=0.3, npts=n, ntox=y)
summary.boin(sel.comb)
plot.boin(sel.comb)


##### combination trial to find a MTD contour (e.g., multiple MTDs)  #####

## get the operating characteristics for BOIN waterfall design
p.true <- matrix(c(0.01, 0.10, 0.20, 0.30,
                0.03, 0.15, 0.30, 0.60,
                0.08, 0.30, 0.60, 0.75), byrow=TRUE, ncol=4)

oc.comb2 <- get.oc.comb(target=0.3, p.true, ncohort=c(8,6,6), cohortsize=3, n.earlystop=12,
       startdose=c(1,1), ntrial=100, mtd.contour=TRUE)
summary.boin(oc.comb2)
plot.boin(oc.comb2)
plot.boin(oc.comb2$selpercent)
plot.boin(oc.comb2$npatients)
plot.boin(oc.comb2$flowchart)


## select the MTD contour based on the trial data
n <- matrix(c(6, 9, 24, 0,  6, 24, 9, 0,  12, 18, 0, 0), ncol=4, byrow=TRUE)
y <- matrix(c(0, 1,  5, 0,  1,  5, 4, 0,  1, 5, 0, 0), ncol=4, byrow=TRUE)
sel.comb2 <- select.mtd.comb(target=0.3, npts=n, ntox=y, mtd.contour=TRUE)
summary.boin(sel.comb2)
plot.boin(sel.comb2)






