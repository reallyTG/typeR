library(KenSyn)


### Name: N2O
### Title: Meta-analysis dataset to estimate the response of N2O emissions
###   to the applied N fertilizer rate
### Aliases: N2O

### ** Examples

summary(N2O)
# Examples of N2O emission measurements obtained on 9 experiments
# for different doses of N fertilizer applied.
par(mfrow=c(3,3), mar=c(4.1,4.1,1,1))
ListNum<-c(12,363,312,232,158,226,87,21,17)
null<-sapply(ListNum, function(Num){plot(N2O$N_rate[N2O$Ref_num==Num],N2O$N2O[N2O$Ref_num==Num],
xlab="Dose engrais N (kg/ha)", ylab="Emission de N2O (kg/ha/an)", pch=19, xlim=c(0,350))})



