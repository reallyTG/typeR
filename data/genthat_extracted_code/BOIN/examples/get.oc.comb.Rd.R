library(BOIN)


### Name: get.oc.comb
### Title: Generate operating characteristics for drug combination trials
### Aliases: get.oc.comb

### ** Examples


###### drug-combination trial ######

##### combination trial to find a single MTD  ######

## get the operating characteristics for BOIN design
p.true <- matrix(c(0.01,0.03,0.10,0.20,0.30,
                 0.03,0.05,0.15,0.30,0.60,
                 0.08,0.10,0.30,0.60,0.75), byrow=TRUE, ncol=5)

oc.comb <- get.oc.comb(target=0.3, p.true, ncohort=20, cohortsize=3,
   n.earlystop=12, startdose=c(1,1), ntrial=100)

summary.boin(oc.comb)
plot.boin(oc.comb$selpercent)
plot.boin(oc.comb$flowchart)


## get the operating characteristics with titration for BOIN design
oc.comb <- get.oc.comb(target=0.3, p.true, ncohort=20, cohortsize=3,
   n.earlystop=12, startdose=c(1,1), ntrial=100)

summary.boin(oc.comb)
plot.boin(oc.comb$selpercent)
plot.boin(oc.comb$flowchart)


##### combination trial to find the MTD contour ######

## find the MTD contour using waterfall design
oc.comb <- get.oc.comb(target=0.3, p.true, ncohort=c(10,5,5), cohortsize=3,
   n.earlystop=12, startdose=c(1,1), ntrial=100, mtd.contour=TRUE)

summary.boin(oc.comb)
plot.boin(oc.comb$selpercent)
plot.boin(oc.comb$flowchart)





