## ----include = FALSE-----------------------------------------------------
library(knitr)
library(easySdcTable)

## ----eval=FALSE, tidy = TRUE---------------------------------------------
#  PTgui()

## ----eval=FALSE, tidy = TRUE---------------------------------------------
#  out <- PTgui(data=EasyData("z1w"))

## ----eval=FALSE, tidy = TRUE---------------------------------------------
#  exeArgus <- "C:/Tau/TauArgus4.1.4/TauArgus.exe" # Tau-argus executable
#  pathArgus <- "C:/Users/nnn/Documents" # Folder for (temporary) tau-argus files
#  PTgui(exeArgus=exeArgus, pathArgus=pathArgus)

## ----comment=NA, tidy = TRUE---------------------------------------------
z2w <- EasyData("z2w") 
print(z2w, row.names=FALSE)

## ----comment=NA, results='hide', tidy = TRUE-----------------------------
ex2w <- ProtectTable(z2w,1,4:7) 

## ----comment=NA, tidy = TRUE---------------------------------------------
print(ex2w$freq, row.names=FALSE)

## ----comment=NA, tidy = TRUE---------------------------------------------
print(ex2w$sdcStatus, row.names=FALSE)

## ----comment=NA, tidy = TRUE---------------------------------------------
print(ex2w$suppressed, row.names=FALSE)

## ----comment=NA, results='hide', tidy = TRUE-----------------------------
ex2wHITAS <- ProtectTable(z2w,dimVar = c("region"),freqVar = c("annet", "arbeid", "soshjelp", "trygd"), method="HITAS")  

## ----comment=NA, tidy = TRUE---------------------------------------------
print(ex2wHITAS$suppressed, row.names=FALSE)

## ----comment=NA, results='hide', tidy = TRUE-----------------------------
ex2wAdvanced <- ProtectTable(z2w,dimVar = c("region", "fylke","kostragr"),freqVar = c("annet", "arbeid", "soshjelp", "trygd"), maxN=2, protectZeros=FALSE, addName=TRUE)  

## ----comment=NA, tidy = TRUE---------------------------------------------
print(ex2wAdvanced$suppressed, row.names=FALSE)

## ----comment=NA, tidy = TRUE---------------------------------------------
prmatrix(ex2wAdvanced$info,rowlab=rep("",99),collab="",quote=FALSE)

## ----comment=NA, tidy = TRUE---------------------------------------------
z2 <- EasyData("z2") 
print(z2)

## ----comment=NA, results='hide', tidy = TRUE-----------------------------
ex2 <- ProtectTable(z2,dimVar = c("region", "hovedint", "kostragr"), freqVar = "ant") 

## ----comment=NA, tidy = TRUE---------------------------------------------
print(ex2$data)

## ----comment=NA, results='hide', tidy = TRUE-----------------------------
ex2micro <- ProtectTable(z2,dimVar = c("region", "hovedint", "kostragr")) 

## ----comment=NA, tidy = TRUE---------------------------------------------
print(ex2micro$data)

