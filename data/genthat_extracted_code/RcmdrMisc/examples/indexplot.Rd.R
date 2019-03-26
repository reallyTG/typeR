library(RcmdrMisc)


### Name: indexplot
### Title: Index Plots
### Aliases: indexplot
### Keywords: hplot

### ** Examples

if (require("car")){
    with(Prestige, indexplot(income, id.n=2, labels=rownames(Prestige)))
    indexplot(Prestige[, c("income", "education", "prestige")], 
        groups = Prestige$type, id.n=2)
}



