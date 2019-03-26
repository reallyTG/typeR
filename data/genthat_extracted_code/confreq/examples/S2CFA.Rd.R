library(confreq)


### Name: S2CFA
### Title: Configural Frequencies Analysis for two Samples.
### Aliases: S2CFA

### ** Examples

#######################################
############### some examples #########
######### example from Marks Textbook
data(Lienert1978)
res1 <- S2CFA(Lienert1978)
summary(res1)
res2 <- S2CFA(Lienert1978, ccor=TRUE) # with continuity correction
summary(res2)
######### example with biger numbers
data(suicide)
ftab(suicide) # 'Epoche' may divide the sample into 2 subsamples  
suicide_2s <- suicide[, c(1,3,2) ] # reorder data that 'Epoche' is the last column
ftab(suicide_2s) # check reordering
suicide_2s_fre <- dat2fre(suicide_2s)
res3 <- S2CFA(suicide_2s_fre)
summary(res3)
res4 <- S2CFA(suicide_2s_fre, ccor=TRUE) # with continuity correction
summary(res4)



