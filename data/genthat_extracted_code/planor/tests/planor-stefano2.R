library("planor")
#source("init.moi")
# options(warn=2, error=recover)
nfac <- 55
nlev <- 2
modelfactors <- planor.factors(factors=list(
k_1=c(0.8*0.4, 0),
k_2=c(0.8*0.2,1.2*0.2),
k_3=c(0.8*0.4,1.2*0.4),
k_4=c(0.8*0.2,1.2*0.2),
k_5=c(0.8*0.4,1.2*0.4),
k_6=c(0.8*0.2,1.2*0.2),
k_7=c(0.8*0.5,1.2*0.5),
k_8=c(0.8*0.1,1.2*0.1),
K_AP=c(0.8*0.7,1.2*0.7),
K_AC=c(0.8*0.6,1.2*0.6),
K_IB=c(0.8*2.2,1.2*2.2)))
##k_dmb=c(0.8*0.01,1.2*0.01),
##k_dmc=c(0.8*0.01,1.2*0.01),
##k_dmp=c(0.8*0.01,1.2*0.01),
##k_dnc=c(0.8*0.12,1.2*0.12),
##k_dn=c(0.8*0.01,1.2*0.01)))
##K_d=c(0.8*0.3,1.2*0.3),
##K_dp=c(0.8*0.1,1.2*0.1),
##K_p=c(0.8*0.1,1.2*0.1),
##K_mB=c(0.8*0.4,1.2*0.4),
##K_mC=c(0.8*0.4,1.2*0.4),
##K_mP=c(0.8*0.31,1.2*0.31),
##k_stot=c(0.8*1.0,1.2*1.0),
##ksB=c(0.8*0.12,1.2*0.12),
##k_sC=c(0.8*1.6,1.2*1.6),
##K_sP=c(0.8*0.6,1.2*0.6),
## n=c(0.8*4,1.2*4),
## m=c(0.8*2,1.2*2),
## V_phos=c(0.8*0.4,1.2*0.4),
## V_1B=c(0.8*0.5,1.2*0.5),
## V_1C=c(0.8*0.6,1.2*0.6),
## V_1P=c(0.8*0.4,1.2*0.4),
## V_1PC=c(0.8*0.4,1.2*0.4),
## V_2B=c(0.8*0.1,1.2*0.1),
## V_2C=c(0.8*0.1,1.2*0.1),
## V_2P=c(0.8*0.3,1.2*0.3),
## V_2PC=c(0.8*0.1,1.2*0.1),
## V_3B=c(0.8*0.5,1.2*0.5),
## V_3PC=c(0.8*0.4,1.2*0.4),
## V_4B=c(0.8*0.2,1.2*0.2),
## V_4PC=c(0.8*0.1,1.2*0.1),
## v_dBC=c(0.8*0.5,1.2*0.5),
## v_dBN=c(0.8*0.6,1.2*0.6),
## v_dCC=c(0.8*0.7,1.2*0.7),
## v_dIN=c(0.8*0.8,1.2*0.8),
## v_dPC=c(0.8*0.7,1.2*0.7),
## v_dPCC=c(0.8*0.7,1.2*0.7),
## v_dPCN=c(0.8*0.7,1.2*0.7),
## v_mB=c(0.8*0.8,1.2*0.8),
## v_mC=c(0.8*1.0,1.2*1.0),
## v_mP=c(0.8*1.1,1.2*1.1),
## v_stot=c(0.8*1.0,1.2*1.0),
## v_sB=c(0.8*1.0,1.2*1.0),
## v_sC=c(0.8*1.1,1.2*1.1),
## v_sP=c(0.8*1.5,1.2*1.5)
## ))
nexp <- 4
resol <- 3
## 
## ################################################
## # Algo symmetric
## ################################################
## 
## ptm <- proc.time()
##
# Rprof(filename = "Rprof.out",line.profiling = TRUE)
ex.key <- planor.designkey(factors=modelfactors, resolution=resol, nunits=nlev^nexp, verbose=TRUE)
# Rprof(NULL)
# R CMD Rprof --lines Rprof.out
## cat("TEMPS planor.designkey symetrique ", proc.time()-ptm,"\n\n\n")

################################################
# Non symmetric
################################################

model<- ~(k_1+k_2+k_3
+k_4+k_5+k_6+k_7+k_8   
 +K_AP   +K_AC   +K_IB)
##  +k_dmb  +k_dmc  +k_dmp  +k_dnc +k_dn)
##  +K_d+K_dp   +K_p+K_mB   +K_mC   +K_mP   +k_stot +ksB   
##  +k_sC   +K_sP
## + n+ m   +V_phos +V_1B   +V_1C   +V_1P  
##  +V_1PC  +V_2B   +V_2C   +V_2P   +V_2PC  +V_3B   +V_3PC  +V_4B  
##  +V_4PC  +v_dBC  +v_dBN  +v_dCC  +v_dIN  +v_dPC  +v_dPCC +v_dPCN
##  +v_mB   +v_mC   +v_mP   +v_stot +v_sB)

ex.mod2 <- planor.model(model=model)

## ptm <- proc.time()
ex.key2 <- planor.designkey(factors=modelfactors, model=ex.mod2, nunits=nlev^nexp, verbose=TRUE)
## cat("TEMPS planor.designkey NON symetrique ", proc.time()-ptm,"\n\n\n")


################################################
# Comparaison
################################################

print(all.equal(ex.key, ex.key2))
ex.des <- planor.design(key=ex.key)
print(summary(ex.des))

#########################################""
