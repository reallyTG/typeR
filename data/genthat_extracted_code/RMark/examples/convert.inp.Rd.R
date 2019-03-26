library(RMark)


### Name: convert.inp
### Title: Convert MARK input file to RMark dataframe
### Aliases: convert.inp
### Keywords: utility

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
# MARK example input file
pathtodata=paste(path.package("RMark"),"extdata",sep="/")
dipper=convert.inp(paste(pathtodata,"dipper",sep="/"),
                    group.df=data.frame(sex=c("M","F")))
# Example input files that accompany the MARK electronic book 
#  \url{http://www.phidot.org/software/mark/docs/book/}
bd=convert.inp(paste(pathtodata,"blckduck",sep="/"),
         covariates=c("age","weight","winglen","ci"),use.comments=TRUE)
aa=convert.inp(paste(pathtodata,"aa",sep="/"),
      group.df=data.frame(sex=c("Poor","Good")))
adult=convert.inp(paste(pathtodata,"adult",sep="/"))
age=convert.inp(paste(pathtodata,"age",sep="/"))
age_ya=convert.inp(paste(pathtodata,"age_ya",sep="/"),
      group.df=data.frame(age=c("Young","Adult")))
capsid=convert.inp(paste(pathtodata,"capsid",sep="/"))
clogit_demo=convert.inp(paste(pathtodata,"clogit_demo",sep="/"))
deer=convert.inp(paste(pathtodata,"deer",sep="/"))
ed_males=convert.inp(paste(pathtodata,"ed_males",sep="/"))
F_age=convert.inp(paste(pathtodata,"f_age",sep="/"))
indcov1=convert.inp(paste(pathtodata,"indcov1",sep="/"),
         covariates=c("cov1","cov2"))
indcov2=convert.inp(paste(pathtodata,"indcov2",sep="/"),
          covariates=c("cov1","cov2"))
island=convert.inp(paste(pathtodata,"island",sep="/"))
linear=convert.inp(paste(pathtodata,"linear",sep="/"))
young=convert.inp(paste(pathtodata,"young",sep="/"))
transient=convert.inp(paste(pathtodata,"transient",sep="/"))
ms_gof=convert.inp(paste(pathtodata,"ms_gof",sep="/"))
m_age=convert.inp(paste(pathtodata,"m_age",sep="/"))
ms_cjs=convert.inp(paste(pathtodata,"ms_cjs",sep="/"))
ms_directional=convert.inp(paste(pathtodata,"ms_directional",sep="/"))
ed=convert.inp(paste(pathtodata,"ed",sep="/"),
            group.df=data.frame(sex=c("Male","Female")))
multigroup=convert.inp(paste(pathtodata,"multi_group",sep="/"),
            group.df=data.frame(sex=c(rep("Female",2),rep("Male",2)),
            Colony=rep(c("Good","Poor"),2)))
LD1=convert.inp(paste(pathtodata,"ld1",sep="/"),
           group.df=data.frame(age=c("Young","Adult")))
yngadt=convert.inp(paste(pathtodata,"yngadt",sep="/"),
            group.df=data.frame(age=c("Young","Adult")))
effect_size=convert.inp(paste(pathtodata,"effect_size",sep="/"),
             group.df=data.frame(colony=c("Poor","Good")))
effect_size3=convert.inp(paste(pathtodata,"effect_size3",sep="/"),
             group.df=data.frame(colony=c("1","2","3")))
## End(No test)



