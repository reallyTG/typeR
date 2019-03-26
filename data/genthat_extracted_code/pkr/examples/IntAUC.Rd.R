library(pkr)


### Name: IntAUC
### Title: Calculate interval AUC
### Aliases: IntAUC
### Keywords: AUC interval AUC partial AUC

### ** Examples

Res = sNCA(Theoph[Theoph$Subject==1,"Time"], Theoph[Theoph$Subject==1, "conc"], 
           dose=320, concUnit="mg/L")
IntAUC(Theoph[Theoph$Subject==1, "Time"], Theoph[Theoph$Subject==1, "conc"], t1=0.5, t2=11, Res)



