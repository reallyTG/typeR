library(semTools)


### Name: measEq.syntax
### Title: Syntax for measurement equivalence
### Aliases: measEq.syntax

### ** Examples

mod.cat <- ' FU1 =~ u1 + u2 + u3 + u4
             FU2 =~ u5 + u6 + u7 + u8 '
## the 2 factors are actually the same factor (FU) measured twice
longFacNames <- list(FU = c("FU1","FU2"))

## configural model: no constraints across groups or repeated measures
syntax.config <- measEq.syntax(configural.model = mod.cat, data = datCat,
                               ordered = paste0("u", 1:8),
                               parameterization = "theta",
                               ID.fac = "std.lv", ID.cat = "Wu.Estabrook.2016",
                               group = "g", longFacNames = longFacNames)
## print lavaan syntax to the Console
cat(as.character(syntax.config))
## print a summary of model features
summary(syntax.config)

## threshold invariance
syntax.thresh <- measEq.syntax(configural.model = mod.cat, data = datCat,
                               ordered = paste0("u", 1:8),
                               parameterization = "theta",
                               ID.fac = "std.lv", ID.cat = "Wu.Estabrook.2016",
                               group = "g", group.equal = "thresholds",
                               longFacNames = longFacNames,
                               long.equal = "thresholds")
## notice that constraining 4 thresholds allows intercepts and residual
## variances to be freely estimated in all but the first group & occasion
cat(as.character(syntax.thresh))
## print a summary of model features
summary(syntax.thresh)


## Fit a model to the data either in a subsequent step:
mod.config <- as.character(syntax.config)
fit.config <- cfa(mod.config, data = datCat, group = "g",
                  ordered = paste0("u", 1:8), parameterization = "theta")
## or in a single step:
fit.thresh <- measEq.syntax(configural.model = mod.cat, data = datCat,
                            ordered = paste0("u", 1:8),
                            parameterization = "theta",
                            ID.fac = "std.lv", ID.cat = "Wu.Estabrook.2016",
                            group = "g", group.equal = "thresholds",
                            longFacNames = longFacNames,
                            long.equal = "thresholds", return.fit = TRUE)

## compare their fit to test threshold invariance
anova(fit.config, fit.thresh)


## Not run: 
##D 
##D ## compare several invariance models
##D test.seq <- c("thresholds","loadings","intercepts","means","residuals")
##D meq.list <- list()
##D for (i in 0:length(test.seq)) {
##D   if (i == 0L) {
##D     meq.label <- "configural"
##D     group.equal <- ""
##D     long.equal <- ""
##D   } else {
##D     meq.label <- test.seq[i]
##D     group.equal <- test.seq[1:i]
##D     long.equal <- test.seq[1:i]
##D   }
##D   meq.list[[meq.label]] <- measEq.syntax(configural.model = mod.cat,
##D                                          data = datCat,
##D                                          ordered = paste0("u", 1:8),
##D                                          parameterization = "theta",
##D                                          ID.fac = "std.lv",
##D                                          ID.cat = "Wu.Estabrook.2016",
##D                                          group = "g",
##D                                          group.equal = group.equal,
##D                                          longFacNames = longFacNames,
##D                                          long.equal = long.equal,
##D                                          return.fit = TRUE)
##D }
##D 
##D compareFit(meq.list)
##D 
## End(Not run)



