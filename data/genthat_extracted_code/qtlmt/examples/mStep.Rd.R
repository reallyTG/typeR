library(qtlmt)


### Name: mStep
### Title: Model selection in multivariate multiple regression
### Aliases: mStep

### ** Examples

data(etrait)
mdf<- data.frame(traits,markers)
## Not run: 
##D mlm<- lm(cbind(T1,T2,T3,T4,T5,T6,T7,T8,T9,T10,T11,T12,T13,T14,T15,T16) ~
##D    m1 + m2 + m3 + m4 + m5, data=mdf)
##D 
##D lw<- formula(paste("~ ", paste("m",1:3,collapse=" + ",sep="")))
##D up<- formula(paste("~", paste("m",1:15,collapse=" + ",sep="")))
##D 
##D ob<- mStep(mlm, scope=list(lower=lw), k=99, direction="backward", data=mdf)
##D of<- mStep(mlm, scope=list(upper=up), k=5, direction="forward", data=mdf)
##D o1<- mStep(mlm, scope=list(upper=up), k=5, direction="both", data=mdf)
##D o2<- mStep(o1, scope=list(upper=up), k=2, direction="forward", data=mdf)
## End(Not run)



