library(AICcmodavg)


### Name: xtable
### Title: Format Objects to LaTeX or HTML
### Aliases: xtable.aictab xtable.bictab xtable.boot.wt xtable.checkParms
###   xtable.countDist xtable.countHist xtable.detHist xtable.dictab
###   xtable.mb.chisq xtable.modavg xtable.modavgShrink xtable.modavgPred
###   xtable.modavgEffect xtable.multComp
### Keywords: models

### ** Examples

if(require(xtable)) {
##model selection example
data(dry.frog)
##setup candidate models
Cand.models <- list( )
Cand.models[[1]] <- lm(log_Mass_lost ~ Shade + Substrate +
                       cent_Initial_mass + Initial_mass2,
                       data = dry.frog)
Cand.models[[2]] <- lm(log_Mass_lost ~ Shade + Substrate +
                       cent_Initial_mass + Initial_mass2 +
                       Shade:Substrate, data = dry.frog)
Cand.models[[3]] <- lm(log_Mass_lost ~ cent_Initial_mass +
                       Initial_mass2, data = dry.frog)
Model.names <- c("additive", "interaction", "no shade")

##model selection table - AICc
out <- aictab(cand.set = Cand.models, modnames = Model.names)

xtable(out)
##exclude AICc and LL
xtable(out, include.AICc = FALSE, include.LL = FALSE)
##remove row names and add caption
print(xtable(out, caption = "Model selection based on AICc"),
      include.rownames = FALSE, caption.placement = "top")


##model selection table - BIC
out2 <- bictab(cand.set = Cand.models, modnames = Model.names)

xtable(out2)
##exclude AICc and LL
xtable(out2, include.BIC = FALSE, include.LL = FALSE)
##remove row names and add caption
print(xtable(out2, caption = "Model selection based on BIC"),
      include.rownames = FALSE, caption.placement = "top")


##model-averaged estimate of Initial_mass2
mavg.mass <- modavg(cand.set = Cand.models, parm = "Initial_mass2",
                    modnames = Model.names)
#model-averaged estimate
xtable(mavg.mass, print.table = FALSE)
#table with contribution of each model
xtable(mavg.mass, print.table = TRUE)  


##model-averaged predictions for first 10 observations
preds <- modavgPred(cand.set = Cand.models, modnames = Model.names,
                    newdata = dry.frog[1:10, ])
xtable(preds)
}


##example of diagnostics
## Not run: 
##D if(require(unmarked)){
##D ##distance sampling example from ?distsamp
##D data(linetran)
##D ltUMF <- with(linetran, {
##D               unmarkedFrameDS(y = cbind(dc1, dc2, dc3, dc4),
##D               siteCovs = data.frame(Length, area, habitat),
##D               dist.breaks = c(0, 5, 10, 15, 20),
##D               tlength = linetran$Length * 1000, survey = "line",
##D               unitsIn = "m")
##D               })
##D 
##D ##summarize counts across distance classes
##D xtable(countDist(ltUMF), table.countDist = "distance")
##D ##summarize counts across all sites
##D xtable(countDist(ltUMF), table.countDist = "count")
##D 
##D ##Half-normal detection function
##D fm1 <- distsamp(~ 1 ~ 1, ltUMF)
##D ##determine parameters with highest SE's
##D xtable(checkParms(fm1))
##D }
## End(Not run)



