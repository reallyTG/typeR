library(ENMeval)


### Name: eval.plot 
### Title: Generate Basic Plot for ENMevaluate Output
### Aliases: eval.plot

### ** Examples


data(enmeval_results)

par(mfrow=c(2,2))
eval.plot(enmeval_results@results, legend.position="topright")
eval.plot(enmeval_results@results, "Mean.AUC", )
eval.plot(enmeval_results@results, "Mean.AUC.DIFF", variance="Var.AUC.DIFF")
eval.plot(enmeval_results@results, "Mean.ORmin")




