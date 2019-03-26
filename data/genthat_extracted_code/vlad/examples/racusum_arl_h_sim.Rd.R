library(vlad)


### Name: racusum_arl_h_sim
### Title: Compute alarm threshold of RA-CUSUM control charts using
###   simulation
### Aliases: racusum_arl_h_sim

### ** Examples

## Not run: 
##D library("vlad")
##D library("spcadjust")
##D data("cardiacsurgery")
##D cardiacsurgery <- dplyr::mutate(cardiacsurgery, phase=factor(ifelse(date < 2*365, "I", "II")))
##D S2 <- subset(cardiacsurgery, c(surgeon==2), c("phase", "Parsonnet", "status"))
##D # subset phase I (In-control) of surgeons 2
##D S2I <- subset(S2, c(phase=="I"), c("Parsonnet", "status"))
##D # estimate coefficients from logit model
##D coeff1 <- round(coef(glm(status~Parsonnet, data=S2I, family="binomial")), 3)
##D 
##D racusum_arl_h_sim(L0=740, df=S2I, coeff=coeff1, m=10^2, nc=4)
## End(Not run)



