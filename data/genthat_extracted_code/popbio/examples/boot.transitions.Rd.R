library(popbio)


### Name: boot.transitions
### Title: Bootstrap observed census transitions
### Aliases: boot.transitions
### Keywords: survey

### ** Examples



data(test.census)

## create stage-fate dataframe using merge and subset
trans01 <- subset(
             merge(test.census, test.census, by="plant", sort=FALSE),  
                     year.x==2001 & year.y==2002)

## format column and row names
trans01<-trans01[,c(1:4,6)]
colnames(trans01)[2:5] <- c("year", "stage", "fruits", "fate")
rownames(trans01) <- 1:nrow(trans01)
# order stage columns corresponding to matrix
trans01$stage <- ordered(trans01$stage, 
                                  levels = c("seedling", "vegetative", "reproductive"))


## add individual fertilities using prebreeding census with no seed bank 
##  based on the proportional reproductive outputs of flowering plants 
## and the total number of seedlings at the end of the projection interval

seedlings<-nrow(subset(test.census, year==2002 & stage=="seedling"))
trans01$seedling<-trans01$fruits/sum(trans01$fruits) * seedlings
trans01

## Step by step instructions for bootstrapping dataframe
n<-nrow(trans01)
n
set.seed(77)
x <- sample(n, replace=TRUE)
x
bt<-trans01[x,]
bt
projection.matrix(bt)

## or respample by stage class counts 
 lapply(split(trans01, trans01$stage, drop=TRUE), 
      function(x) x[sample(nrow(x), replace=TRUE),])

## using boot.transitions
boot.transitions(trans01, 5)
boot.transitions(trans01, 5, by.stage=TRUE)

## Aquilegia example
data(aq.trans)
x<-subset(aq.trans, year==1996)
# calculate lamda, seed survival and recruitment rate using aq.matrix
rec<-nrow(subset(aq.trans, year==1997 & stage == "recruit"))
aq.96<- aq.matrix(x, rec)
# add  individual fertilities to data frame only
aq.96.trans<-aq.matrix(x, rec, summary=FALSE)
# pass estimated transitions in aq.96 to projection matrix 
aq.96.boot<-boot.transitions(aq.96.trans, 200, 
            add=c(1,1, aq.96$seed.survival, 2,1, aq.96$recruitment.rate) )
# calculate percentile intervals using quantile()
ci<- quantile(aq.96.boot$lambda, c(0.025,0.975) )
aq.96$lambda
ci
# plot histogram
hist(aq.96.boot$lambda, col="green", xlab="Lambda", 
        main=paste('Bootstrap estimates of population\ngrowth rate from 1996-1997'))
abline(v=ci, lty=3)





