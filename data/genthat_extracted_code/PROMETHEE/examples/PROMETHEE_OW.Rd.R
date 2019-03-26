library(PROMETHEE)


### Name: PROMETHEE_OW
### Title: Preference Ranking Organization METHod for the Enrichment of
###   Evaluations with Optimal Weights
### Aliases: PROMETHEE_OW

### ** Examples


data(Austria)

PreferenceF= matrix("Level",nrow(Austria),ncol(Austria) )
PreferenceT=matrix(0,nrow(Austria),ncol(Austria) )
IndifferenceT=matrix(0,nrow(Austria),ncol(Austria) )
Weights=matrix(1,nrow(Austria),ncol(Austria) )
Min_Max=matrix("min",nrow(Austria),ncol(Austria) )
S_Gauss=matrix(0,nrow(Austria),ncol(Austria) )

PF=PROMETHEE_OW(Austria, PreferenceF,PreferenceT,IndifferenceT,Weights,Min_Max,S_Gauss,
                "Optimistic")
PF$Res
PF=PROMETHEE_OW(Austria, PreferenceF,PreferenceT,IndifferenceT,Weights,Min_Max,S_Gauss,
                "Pessimistic")
PF$Res




