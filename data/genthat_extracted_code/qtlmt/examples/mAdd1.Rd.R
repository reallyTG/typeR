library(qtlmt)


### Name: mAdd1
### Title: Add or drop all possible terms
### Aliases: mAdd1 mDrop1

### ** Examples

data(etrait)
mdf<- data.frame(traits,markers)
## Not run: 
##D mlm<- lm(cbind(T1,T2,T3,T4,T5,T6,T7,T8,T9,T10,T11,T12,T13,T14,T15,T16) ~
##D    m1 + m2 + m3 + m4 + m5, data=mdf)
##D 
##D up<- formula(paste("~", paste("m",1:15,collapse=" + ",sep="")))
##D oa<- mAdd1(mlm, scope=up, test="F", k=5, data=mdf)
##D 
##D lw<- formula(paste("~ ", paste("m",1:3,collapse=" + ",sep="")))
##D od<- mDrop1(mlm, scope=lw, test="F", k=5, data=mdf)
## End(Not run)



