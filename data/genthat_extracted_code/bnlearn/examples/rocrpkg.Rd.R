library(bnlearn)


### Name: ROCR integration
### Title: Generating a prediction object for ROCR
### Aliases: 'ROCR integration' as.prediction as.prediction.bn.strength
### Keywords: interfaces to other packages

### ** Examples

## Not run: 
##D library(ROCR)
##D 
##D modelstring = paste0("[HIST|LVF][CVP|LVV][PCWP|LVV][HYP][LVV|HYP:LVF][LVF]",
##D   "[STKV|HYP:LVF][ERLO][HRBP|ERLO:HR][HREK|ERCA:HR][ERCA][HRSA|ERCA:HR][ANES]",
##D   "[APL][TPR|APL][ECO2|ACO2:VLNG][KINK][MINV|INT:VLNG][FIO2][PVS|FIO2:VALV]",
##D   "[SAO2|PVS:SHNT][PAP|PMB][PMB][SHNT|INT:PMB][INT][PRSS|INT:KINK:VTUB][DISC]",
##D   "[MVS][VMCH|MVS][VTUB|DISC:VMCH][VLNG|INT:KINK:VTUB][VALV|INT:VLNG][ACO2|VALV]",
##D   "[CCHL|ACO2:ANES:SAO2:TPR][HR|CCHL][CO|HR:STKV][BP|CO:TPR]")
##D true.dag = model2network(modelstring)
##D strength = boot.strength(alarm, R = 200, m = 30, algorithm = "hc")
##D pred = as.prediction(strength, true.dag)
##D perf = performance(pred, "tpr", "fpr")
##D plot(perf, main = "Arc Detection")
##D performance(pred, "auc")
## End(Not run)



