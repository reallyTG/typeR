library(pkr)


### Name: sNCA
### Title: Simplest NCA
### Aliases: sNCA
### Keywords: Output Form

### ** Examples

# For one subject
x = Theoph[Theoph$Subject=="1","Time"]
y = Theoph[Theoph$Subject=="1","conc"]

sNCA(x, y, dose=320, doseUnit="mg", concUnit="mg/L", timeUnit="h")
sNCA(x, y, dose=320, concUnit="mg/L", returnNA=FALSE)

iAUC = data.frame(Name=c("AUC[0-12h]","AUC[0-24h]"), Start=c(0,0), End=c(12,24))
sNCA(x, y, dose=320, doseUnit="mg", concUnit="mg/L", timeUnit="h", iAUC=iAUC)

MW = 180.164 # Molecular weight of theophylline

sNCA(x, y/MW, dose=320, doseUnit="mg", concUnit="mmol/L", timeUnit="h")
sNCA(x, y/MW, dose=320, doseUnit="mg", concUnit="mmol/L", timeUnit="h", MW=MW)
sNCA(x, y, dose=320/MW, doseUnit="mmol", concUnit="mg/L", timeUnit="h", MW=MW)
sNCA(x, y/MW, dose=320/MW, doseUnit="mmol", concUnit="mmol/L", timeUnit="h", MW=MW)

sNCA(x, y/MW, dose=320/MW, doseUnit="mmol", concUnit="mmol/L", timeUnit="h", MW=MW, 
     returnNA=FALSE)
sNCA(x, y/MW, doseUnit="mmol", concUnit="mmol/L", timeUnit="h", MW=MW, returnNA=FALSE)
sNCA(x, y/MW, dose=as.numeric(NA), doseUnit="mmol", concUnit="mmol/L", timeUnit="h", 
     MW=MW, returnNA=FALSE)

sNCA(x, y, dose=320, concUnit="mg/L", timeUnit="hr")
sNCA(x*60, y, dose=320, concUnit="mg/L", timeUnit="min")



