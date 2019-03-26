library(pkr)


### Name: pkr-package
### Title: Pharmacokinetics in R
### Aliases: pkr-package pkr
### Keywords: package NCA

### ** Examples

# Theoph and Indometh data: dose in mg, conc in mg/L, time in h
NCA(Theoph, "Subject", "Time", "conc", dose=320, uConc="mg/L")
NCA(Indometh, "Subject", "time", "conc", dose=25, adm="Bolus", uConc="mg/L")

iAUC = data.frame(Name=c("AUC[0-12h]","AUC[0-24h]"), Start=c(0,0), End=c(12,24)) ; iAUC
NCA(Theoph, "Subject", "Time", "conc", dose=320, iAUC=iAUC, uConc="mg/L")
NCA(Indometh, "Subject", "time", "conc", dose=25, adm="Bolus", iAUC=iAUC, uConc="mg/L")

writeLines(NCA(Theoph, "Subject", "Time", "conc", dose=320, report="Text", uConc="mg/L"),
           "Theoph_Linear_CoreOutput.txt")
writeLines(NCA(Theoph, "Subject", "Time", "conc", dose=320, fit="Log", report="Text",
           uConc="mg/L"), "Theoph_Log_CoreOutput.txt")
writeLines(NCA(Indometh, "Subject", "time", "conc", dose=25, adm="Bolus", report="Text",
           uConc="mg/L"), "Indometh_Bolus_Linear_CoreOutput.txt")
writeLines(NCA(Indometh, "Subject", "time", "conc", dose=25, adm="Bolus", fit="Log",
           report="Text", uConc="mg/L"), "Indometh_Bolus_Log_CoreOutput.txt")
writeLines(NCA(Indometh, "Subject", "time", "conc", dose=25, adm="Infusion", dur=0.25,
           report="Text", uConc="mg/L"), "Indometh_Infusion_Linear_CoreOutput.txt")
writeLines(NCA(Indometh, "Subject", "time", "conc", dose=25, adm="Infusion", dur=0.25,
           fit="Log", report="Text", uConc="mg/L"), "Indometh_Infusion_Log_CoreOutput.txt")

sNCA(Theoph[Theoph$Subject==1,"Time"], Theoph[Theoph$Subject==1, "conc"], dose=320, concUnit="mg/L")
sNCA(Indometh[Indometh$Subject==1,"time"], Indometh[Indometh$Subject==1, "conc"], dose=25,
        adm="Bolus", concUnit="mg/L")
sNCA(Indometh[Indometh$Subject==1,"time"], Indometh[Indometh$Subject==1, "conc"], dose=25,
        adm="Infusion", dur=0.25, concUnit="mg/L")

iAUC = data.frame(Name=c("AUC[0-12h]","AUC[0-24h]"), Start=c(0,0), End=c(12,24)) ; iAUC
sNCA(Theoph[Theoph$Subject==1,"Time"], Theoph[Theoph$Subject==1, "conc"], dose=320,
        iAUC=iAUC, concUnit="mg/L")
sNCA(Indometh[Indometh$Subject==1,"time"], Indometh[Indometh$Subject==1, "conc"], dose=25,
        adm="Bolus", iAUC=iAUC, concUnit="mg/L")
sNCA(Indometh[Indometh$Subject==1,"time"], Indometh[Indometh$Subject==1, "conc"], dose=25,
        adm="Infusion", dur=0.25, iAUC=iAUC, concUnit="mg/L")



