library(SEERaBomb)


### Name: getDF
### Title: Converts a seerSet$L series to a data.frame
### Aliases: getDF
### Keywords: IO

### ** Examples

## Not run: 
##D  
##D library(SEERaBomb)
##D load("~/data/SEER/mrgd/cancDef.RData") #load in canc
##D load("~/data/SEER/mrgd/popsae.RData") # load in popsae
##D canc=canc%>%select(-reg,-recno,-agerec,-numprims,-COD,
##D           -age19,-age86,-radiatn,-ICD9,-db,-histo3) 
##D popsa=popsae%>%group_by(db,race,sex,age,year)%>%summarize(py=sum(py)) # sum on regs
##D pm=seerSet(canc,popsa,Sex="male",ageStart=0,ageEnd=100) #pooled (races) male seerSet
##D pm=mk2D(pm,secondS=c("AML","MDS"))
##D firstS=c("NHL","MM")
##D pm=csd(pm,brkst=c(0,1,5),trts=c("rad","noRad"),firstS=firstS)
##D pm$DF 
##D getDF(pm)
## End(Not run)



