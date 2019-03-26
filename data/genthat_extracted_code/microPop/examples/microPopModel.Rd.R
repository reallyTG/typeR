library(microPop)


### Name: microPopModel
### Title: microPopModel
### Aliases: microPopModel

### ** Examples

#simplest example - define one microbial group (Archea) with 4 resources and
#simulate growth over 50 days
#make microbial group data frame:
MFG=matrix(NA,ncol=4,nrow=6,dimnames=list(c('Rtype','halfSat','yield',
'maxGrowthRate','stoichiom','keyResource'),c('H2','CO2','CH4','H2O')))
MFG['Rtype',]=c('Se','Se','P','P')
MFG['halfSat',c('H2','CO2')]=1e-6
MFG['yield','H2']=0.2
MFG['maxGrowthRate','H2']=2
MFG['keyResource',1]='H2'
MFG['stoichiom',]=c(4,1,1,2)
Archea=data.frame(MFG,stringsAsFactors=FALSE)

#make resourceSysInfo data frame
Rmat=matrix(NA,ncol=4,nrow=4,dimnames=list(c('startValue','inflowRate',
'washOut','molarMass'),c('H2','CO2','CH4','H2O')))
Rmat['startValue',]=c(1,1,0,0)
Rmat['inflowRate',]=c(1,5,0,0)
Rmat['washOut',]=c(0.1,0.1,0.1,0.1)
Rmat['molarMass',]=c(2,44,16,18)

#make microbeSysInfo data frame
Mmat=matrix(NA,ncol=1,nrow=3,dimnames=list(c('startValue','inflowRate',
'washOut'),c('Archea')))
Mmat['startValue',]=1
Mmat['inflowRate',]=0
Mmat['washOut',]=0.1

out=microPopModel(
    microbeNames='Archea',
    times=seq(0,50,0.1),
    resourceSysInfo=data.frame(Rmat,stringsAsFactors=FALSE),
    microbeSysInfo=data.frame(Mmat,stringsAsFactors=FALSE)
)



