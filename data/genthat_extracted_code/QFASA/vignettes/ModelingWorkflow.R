## ---- eval=TRUE----------------------------------------------------------
library(QFASA)

## ---- eval=TRUE----------------------------------------------------------
dist.meas=1

## ---- eval=TRUE----------------------------------------------------------
data(FAset)
fa.set = as.vector(unlist(FAset))

## ---- eval=TRUE----------------------------------------------------------
data(predatorFAs)
tombstone.info = predatorFAs[,1:4]
predator.matrix = predatorFAs[,5:(ncol(predatorFAs))]

# number of predator FA signatures this is used to create the matrix of CC values (see section 6 below)
npredators = nrow(predator.matrix)

## ---- eval=TRUE----------------------------------------------------------
#full file
data(preyFAs)

#extract prey FA only from data frame and subset them for the FA set designated above
prey.sub=(preyFAs[,4:(ncol(preyFAs))])[fa.set]

#renormalize over 1
prey.sub=prey.sub/apply(prey.sub,1,sum) 

#extract the modelling group names from the full file
group=as.vector(preyFAs$Species)

#add modelling group names to the subsetted and renormalized FAs
prey.matrix=cbind(group,prey.sub)

#create an average value for the FA signature for each designated modelling group
prey.matrix=MEANmeth(prey.matrix) 

## ---- eval=TRUE----------------------------------------------------------
#numbers are the column which identifies the modelling group, and the column which contains the lipid contents
FC = preyFAs[,c(2,3)] 
FC = as.vector(tapply(FC$lipid,FC$Species,mean,na.rm=TRUE))

## ---- eval=TRUE----------------------------------------------------------
data(CC)
cal.vec = CC[,2]
cal.mat = replicate(npredators, cal.vec)

## ---- eval=TRUE----------------------------------------------------------
Q = p.QFASA(predator.matrix, prey.matrix, cal.mat, dist.meas, gamma=1, FC, start.val=rep(1,nrow(prey.matrix)), fa.set)

## ---- eval=TRUE----------------------------------------------------------
DietEst = Q$'Diet Estimates'

#estimates changed from proportions to percentages
DietEst = round(DietEst*100,digits=2)
colnames(DietEst) = (as.vector(rownames(prey.matrix)))
DietEst = cbind(tombstone.info,DietEst)

## ---- eval=TRUE----------------------------------------------------------
# plyr package
library(plyr)
Add.meas = ldply(Q$'Additional Measures', data.frame)

