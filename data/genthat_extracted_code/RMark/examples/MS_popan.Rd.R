library(RMark)


### Name: MS_popan
### Title: Convert Multistate data for POPAN-style abundance estimation
### Aliases: MS_popan

### ** Examples

## No test: 
data(dipper)
popan_N=summary(mark(dipper,model="POPAN",
        model.parameters=list(pent=list(formula=~time))),se=TRUE)$reals$N
data.list=MS_popan(dipper,ddl=TRUE,augment_num=30)
modMS=mark(data.list$data,data.list$ddl,
        model.parameters=list(Psi=list(formula=~B:toB:time)),brief=TRUE)
Psi_estimates=summary(modMS,se=TRUE)$reals$Psi
Nhat_MS=Psi_estimates$estimate[1]*sum(abs(data.list$data$data$freq))
se_Nhat_MS=Psi_estimates$se[1]*Nhat_MS
cat("Popan N = ",popan_N$estimate," (se = ",popan_N$se,")\n")
cat("MS N = ",Nhat_MS," (se = ",se_Nhat_MS,")\n")
## End(No test)



