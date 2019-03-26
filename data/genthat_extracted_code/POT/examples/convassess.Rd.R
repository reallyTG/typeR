library(POT)


### Name: convassess
### Title: Convergence Assessment for Fitted Objects
### Aliases: convassess convassess.uvpot convassess.bvpot convassess.mcpot
### Keywords: htest

### ** Examples

##Univariate Case
x <- rgpd(30, 0, 1, 0.2)
med <- fitgpd(x, 0, "med")
convassess(med)
##Bivariate Case
x <- rbvgpd(50, model = "log", alpha = 0.5, mar1 = c(0, 1, 0.2))
log <- fitbvgpd(x, c(0,0))
convassess(log)



