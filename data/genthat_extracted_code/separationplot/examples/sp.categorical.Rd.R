library(separationplot)


### Name: sp.categorical
### Title: Separation plots for variables with more than two outcome levels
### Aliases: sp.categorical
### Keywords: sp.categorical

### ** Examples

## No test: 
## no reason was given for \donttest here.
# Example using an ordered probit model from 
# Neumayer (2005) "Do international human rights treaties improve respect
#  for human rights?"
#  Journal of Conflict Resolution, 49 (6), 2005,  pp. 925-953 

library(foreign) 
library(MASS)

neumayer <- 
  read.dta("http://www2.lse.ac.uk/dataFiles/geographyAndEnvironment/Replication/Article%20for%20JCR%20(Human%20Rights).dta")

# create a new dataframe called "data4" that just contains the variables
#  we're interested in (and with simpler names).
data6<-na.omit(data.frame(DV=neumayer$aipts, laggedDV=neumayer$laipts,
   rat=neumayer$iccprmainrat, ingo.pc=neumayer$wiikngointerpc,
   dem=neumayer$politycorr020, extwar=neumayer$uppsalaexternalincountry,
   civwar=neumayer$uppsalainternal, gdp=neumayer$lngdp1995pc,
    pop=neumayer$lnpop, country=neumayer$country, year=neumayer$year))

# run the model (note that this is Model 6 of Table 2 of the published paper):
model6 <-
   polr(as.ordered(DV) ~ laggedDV+rat+rat:ingo.pc+rat:dem+ingo.pc+dem+extwar+civwar+gdp+pop,
        data=data6, Hess=TRUE, method="probit")
summary(model6) 

sp.categorical(pred=model6$fitted.values, actual=as.character(model6$model[,1]),
               cex=2.5)

## End(No test)



