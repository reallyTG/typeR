library(NonCompart)


### Name: NonCompart-package
### Title: Noncompartmental Analysis for Pharmacokinetic Data
### Aliases: NonCompart-package NonCompart

### ** Examples

# Theoph and Indometh data: dose in mg, conc in mg/L, time in h
tblNCA(Theoph, key="Subject", colTime="Time", colConc="conc", dose=320,
       adm="Extravascular", doseUnit="mg", concUnit="mg/L")

tblNCA(Indometh, key="Subject", colTime="time", colConc="conc", dose=25, 
       adm="Infusion", dur=0.5, doseUnit="mg", concUnit="mg/L", R2ADJ=0.9)

# For individual NCA
iAUC = data.frame(Name=c("AUC[0-12h]","AUC[0-24h]"), Start=c(0,0), End=c(12,24)) ; iAUC

x = Theoph[Theoph$Subject=="1","Time"]
y = Theoph[Theoph$Subject=="1","conc"]

sNCA(x, y, dose=320, doseUnit="mg", concUnit="mg/L", timeUnit="h", iAUC=iAUC)
sNCA(x, y, dose=320, concUnit="mg/L", iAUC=iAUC)



