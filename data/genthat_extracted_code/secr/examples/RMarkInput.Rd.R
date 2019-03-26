library(secr)


### Name: RMarkInput
### Title: Convert Data to RMark Input Format
### Aliases: RMarkInput unRMarkInput
### Keywords: manip

### ** Examples


## ovenCH is a 5-year mist-netting dataset
ovenRD <- RMarkInput (join(ovenCH))
head(ovenRD)

unRMarkInput(ovenRD)

RMarkInput(deermouse.ESG, covariates = FALSE, grouped = TRUE)
RMarkInput(deermouse.ESG, covariates = TRUE)

## Not run: 
##D ## fit robust-design model in RMark (MARK must be  installed)
##D ## may need to set MarkPath, e.g., MarkPath <- 'c:/MARK'
##D library(RMark)
##D ovenRD.data <- process.data(ovenRD, model = "Robust",
##D     time.interval = attr(ovenRD, "intervals"))
##D ovenRD.model <- mark(data = ovenRD.data, model = "Robust",
##D     model.parameters = list(p = list(formula = ~1, share = TRUE),
##D     GammaDoublePrime = list(formula = ~1),
##D     GammaPrime = list(formula = ~1),
##D     f0 = list(formula = ~1)))   
##D cleanup(ask = FALSE)
## End(Not run)





