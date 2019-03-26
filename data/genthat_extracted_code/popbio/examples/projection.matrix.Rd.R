library(popbio)


### Name: projection.matrix
### Title: Construct projection matrix models using transition frequency
###   tables
### Aliases: projection.matrix
### Keywords: survey

### ** Examples


data(test.census)

trans01 <- subset(merge(test.census, test.census, by = "plant",   sort =FALSE), 
                    year.x==2001 & year.y==2002 )
## Add individual fertilities using "anonymous reproduction"  based on the 
## proportional reproductive outputs of flowering plants and the total number 
## of seedlings at the end of the projection interval
trans01$seedferts <- trans01$fruits.x/sum(trans01$fruits.x) * 5
trans01

stages<-c("seedling", "vegetative", "reproductive")

## three ways to specify columns
projection.matrix(trans01, stage.x, stage.y, seedferts, stages)
projection.matrix(trans01, 3, 6, 8, c(3,4,2))
projection.matrix(trans01, "stage.x", "stage.y", "seedferts", stages)

## BEST to use column default (fertility column (seedling) now matches stage class name)
names(trans01)[c(3, 6, 8)] <- c("stage", "fate", "seedling")
# AND order stages in dataframe
trans01$stage<-ordered(trans01$stage, stages)

projection.matrix(trans01)
projection.matrix(trans01, TF=TRUE)

## Example using Aquilegia data
data(aq.trans)
sf<- subset(aq.trans, year==1998 & plot==909, c(year, plant, stage, fruits, fate))
## rows and columns of final matrix
levels(sf$stage)

## seedlings next year
seedlings<-nrow(subset(aq.trans, plot==909 & year==1999 & stage=="recruit")) 

## ADD individual fertility estimates for recruits and seeds assuming seed bank and
## new seeds contribute to a common germinant pool with equal chance of recruitment

seed.survival<-.4
seed.bank.size<-1000
seeds.per.fruit<-50

seeds.from.plants<-sum(sf$fruits)*seeds.per.fruit
recruitment.rate<-seedlings/(seed.bank.size + seeds.from.plants)

## add two fertility columns
sf$recruit<- sf$fruits/sum(sf$fruits) * seeds.from.plants * recruitment.rate
sf$seed<-sf$fruits * seeds.per.fruit * seed.survival

## add seed bank survival and seed bank recruitment rate to transition matrix
A<-projection.matrix(sf, add=c(1,1, seed.survival, 2,1, recruitment.rate ))
A
max(Re(eigen(A)$values))



