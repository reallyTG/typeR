library(marked)


### Name: sealions
### Title: Multivariate State example data
### Aliases: sealions
### Keywords: datasets

### ** Examples

## No test: 
### Load packages ###
# The splines package is only necessary for fitting b-spline curves used in the paper
# It is not required for the multivate models in the marked package
library(splines)

# Get data
data(sealions)

# Process data for multivariate models in marked
dp=process.data(sealions,model="mvmscjs",
  strata.labels=list(area=c("A","S"),ltag=c("+","-","u"),rtag=c("+","-","u")))

### Make design data
ddl=make.design.data(dp)

# Create pup variable for Phi
ddl$Phi$pup=ifelse(ddl$Phi$Age==0,1,0)
ddl$Phi$sex=factor(ddl$Phi$sex)

# Detection model
# Set final year (2014)  p=0 (no resight data) for ANI
ddl$p$fix = ifelse(ddl$p$Time==17 & ddl$p$area=="A", 0, ddl$p$fix)

# Delta model
# create indicator variables for 'unknown' tag observations
ddl$delta$obs.ltag.u = ifelse(ddl$delta$obs.ltag=="u", 1, 0)
ddl$delta$obs.rtag.u = ifelse(ddl$delta$obs.rtag=="u", 1, 0)

# Psi model
# Set Psi to 0 for cases which are not possible - missing tag to having tag
ddl$Psi$fix[as.character(ddl$Psi$ltag)=="-"&as.character(ddl$Psi$toltag)=="+"]=0
ddl$Psi$fix[as.character(ddl$Psi$rtag)=="-"&as.character(ddl$Psi$tortag)=="+"]=0
# Create indicator variables for transitioning between states
ddl$Psi$AtoS=ifelse(ddl$Psi$area=="A"&ddl$Psi$toarea=="S",1,0)  # ANI to SMI movement
ddl$Psi$StoA=ifelse(ddl$Psi$area=="S"&ddl$Psi$toarea=="A",1,0)  # SMI to ANI movement
ddl$Psi$lpm=ifelse(ddl$Psi$ltag=="+"&ddl$Psi$toltag=="-",1,0)   # Losing left tag
ddl$Psi$rpm=ifelse(ddl$Psi$rtag=="+"&ddl$Psi$tortag=="-",1,0)   # Losing right tag
ddl$Psi$sex=factor(ddl$Psi$sex)

# formulas
Psi.1=list(formula=~-1+ AtoS:sex + AtoS:sex:bs(Age) + StoA:sex + StoA:sex:bs(Age) + 
                     I(lpm+rpm) +I(lpm+rpm):Age + lpm:rpm)
p.1=list(formula=~time*area)
delta.1=list(formula= ~ -1 + obs.ltag.u + obs.rtag.u + obs.ltag.u:obs.rtag.u)
Phi.1=list(formula=~sex*bs(Age)+pup:weight+area)

# Fit model - commented out because it takes >1hr to run
# mod=crm(dp,ddl,model.parameters=list(Psi=Psi.1,p=p.1,delta=delta.1,Phi=Phi.1),hessian=TRUE)
## End(No test)



