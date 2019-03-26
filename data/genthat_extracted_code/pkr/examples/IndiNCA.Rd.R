library(pkr)


### Name: IndiNCA
### Title: Noncompartmental Analysis for an Individual
### Aliases: IndiNCA
### Keywords: NCA noncompartmenal analysis

### ** Examples

IndiNCA(Theoph[Theoph$Subject==1,"Time"], Theoph[Theoph$Subject==1, "conc"], dose=320, uConc="mg/L")
IndiNCA(Indometh[Indometh$Subject==1,"time"], Indometh[Indometh$Subject==1, "conc"], dose=25,
        adm="Bolus", uConc="mg/L")
IndiNCA(Indometh[Indometh$Subject==1,"time"], Indometh[Indometh$Subject==1, "conc"], dose=25,
        adm="Infusion", dur=0.25, uConc="mg/L")

IndiNCA(Theoph[Theoph$Subject==1,"Time"], Theoph[Theoph$Subject==1, "conc"], dose=320,
        report="Text", uConc="mg/L")
IndiNCA(Indometh[Indometh$Subject==1,"time"], Indometh[Indometh$Subject==1, "conc"], dose=25,
        adm="Bolus", report="Text", uConc="mg/L")
IndiNCA(Indometh[Indometh$Subject==1,"time"], Indometh[Indometh$Subject==1, "conc"], dose=25,
        adm="Infusion", dur=0.25, report="Text", uConc="mg/L")

iAUC = data.frame(Name=c("AUC[0-12h]","AUC[0-24h]"), Start=c(0,0), End=c(12,24)) ; iAUC
IndiNCA(Theoph[Theoph$Subject==1,"Time"], Theoph[Theoph$Subject==1, "conc"], dose=320,
        iAUC=iAUC, uConc="mg/L")
IndiNCA(Indometh[Indometh$Subject==1,"time"], Indometh[Indometh$Subject==1, "conc"], dose=25,
        adm="Bolus", iAUC=iAUC, uConc="mg/L")
IndiNCA(Indometh[Indometh$Subject==1,"time"], Indometh[Indometh$Subject==1, "conc"], dose=25,
        adm="Infusion", dur=0.25, iAUC=iAUC, uConc="mg/L")



