library(DoseFinding)


### Name: MCTtest
### Title: Performs multiple contrast test
### Aliases: MCTtest

### ** Examples

## example without covariates
data(biom)
## define shapes for which to calculate optimal contrasts
modlist <- Mods(emax = 0.05, linear = NULL, logistic = c(0.5, 0.1),
                linInt = c(0, 1, 1, 1), doses = c(0, 0.05, 0.2, 0.6, 1))
m1 <- MCTtest(dose, resp, biom, models=modlist)
## now calculate critical value (but not p-values)
m2 <- MCTtest(dose, resp, biom, models=modlist, critV = TRUE, pVal = FALSE)
## now hand over critical value
m3 <- MCTtest(dose, resp, biom, models=modlist, critV = 2.24)

## example with covariates
data(IBScovars)
modlist <- Mods(emax = 0.05, linear = NULL, logistic = c(0.5, 0.1),
                linInt = c(0, 1, 1, 1), doses = c(0, 1, 2, 3, 4))
MCTtest(dose, resp, IBScovars, models = modlist, addCovars = ~gender)

## example using general approach (fitted on placebo-adjusted scale)
ancMod <- lm(resp~factor(dose)+gender, data=IBScovars)
## extract estimates and information to feed into MCTtest
drEst <- coef(ancMod)[2:5]
vc <- vcov(ancMod)[2:5, 2:5]
doses <- 1:4
MCTtest(doses, drEst, S = vc, models = modlist, placAdj = TRUE,
        type = "general", df = Inf)

## example with general alternatives handed over
data(biom)
## calculate contrast matrix for the step-contrasts
## represent them as linInt models
models <- Mods(linInt=rbind(c(1,1,1,1),
                            c(0,1,1,1),
                            c(0,0,1,1),
                            c(0,0,0,1)),
                doses=c(0,0.05,0.2,0.6,1))
plot(models)
## now calculate optimal contrasts for these means
## use weights from actual sample sizes
weights <- as.numeric(table(biom$dose))
contMat <- optContr(models, w = weights)
## plot contrasts
plot(contMat)
## perform multiple contrast test
MCTtest(dose, resp, data=biom, contMat = contMat)

## example for using the Dunnett contrasts
## Dunnett contrasts
doses <- sort(unique(biom$dose))
contMat <- rbind(-1, diag(4))
rownames(contMat) <- doses
colnames(contMat) <- paste("D", doses[-1], sep="")
MCTtest(dose, resp, data=biom, contMat = contMat)



