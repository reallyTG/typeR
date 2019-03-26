library(bnlearn)


### Name: graphviz.chart
### Title: Plotting networks with probability bars
### Aliases: graphviz.chart
### Keywords: plots interfaces to other packages

### ** Examples

## Not run: 
##D modelstring = paste("[HIST|LVF][CVP|LVV][PCWP|LVV][HYP][LVV|HYP:LVF][LVF]",
##D   "[STKV|HYP:LVF][ERLO][HRBP|ERLO:HR][HREK|ERCA:HR][ERCA][HRSA|ERCA:HR][ANES]",
##D   "[APL][TPR|APL][ECO2|ACO2:VLNG][KINK][MINV|INT:VLNG][FIO2][PVS|FIO2:VALV]",
##D   "[SAO2|PVS:SHNT][PAP|PMB][PMB][SHNT|INT:PMB][INT][PRSS|INT:KINK:VTUB][DISC]",
##D   "[MVS][VMCH|MVS][VTUB|DISC:VMCH][VLNG|INT:KINK:VTUB][VALV|INT:VLNG][ACO2|VALV]",
##D   "[CCHL|ACO2:ANES:SAO2:TPR][HR|CCHL][CO|HR:STKV][BP|CO:TPR]", sep = "")
##D dag = model2network(modelstring)
##D fitted = bn.fit(dag, alarm)
##D 
##D # Netica style.
##D graphviz.chart(fitted, grid = TRUE, bg = "beige", bar.col = "black")
##D # Hugin style.
##D graphviz.chart(fitted, type = "barprob", grid = TRUE, bar.col = "green",
##D   strip.bg = "lightyellow")
##D # GeNIe style.
##D graphviz.chart(fitted, col = "darkblue", bg = "azure", bar.col = "darkblue")
##D # personal favourites.
##D graphviz.chart(fitted, type = "barprob", grid = TRUE, bar.col = "darkgreen",
##D   strip.bg = "lightskyblue")
##D graphviz.chart(fitted, type = "barprob", grid = TRUE, bar.col = "gold",
##D   strip.bg = "lightskyblue")
##D # dot-plot version.
##D graphviz.chart(fitted, type = "dotplot")
## End(Not run)



