library(FlexParamCurve)


### Name: get.mod
### Title: Copy objects between R environments
### Aliases: get.mod

### ** Examples


 #transfer all nlsList models from the FlexParamCurve working environmment (FPCEnv) 

   #to the Global Environment. Note: unless pn.mod.compare or 

   #pn.modselect.step have been run, in which case this is default

   #1. subset data object (only 3 individuals) to expediate model selection

   subdata <- subset(posneg.data, as.numeric(row.names (posneg.data) ) < 40)

   #2. run model selection in FPCEnv using pn.mod.compare. Only two models (#1 and #5)

   #specified to be run here to reduce processing time. see pn.mod.compare

   modseltable <- pn.mod.compare(subdata$age, subdata$mass,

   subdata$id, existing = FALSE, pn.options = "myoptions", mod.subset = c(1,5)

   , Envir = FlexParamCurve:::FPCEnv)

   #3. retrieve models from FlexParamCurve working environmment

   get.mod()

   #transfer an options file called myoptions from FPCEnv to the Global Environment

   #note data are forced to fit a monotonic curve in this example

   modpar(logist.data$age, logist.data$mass, pn.options = "myoptions.1", force4par = TRUE, 

   Envir = FlexParamCurve:::FPCEnv)

   get.mod(modelname = "myoptions.1", write.mod = TRUE)




