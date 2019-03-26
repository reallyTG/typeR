library(DLMtool)


### Name: DCACs
### Title: Depletion Corrected Average Catch
### Aliases: DCACs DCAC DCAC_40 DCAC4010 DCAC_ML DAAC HDAAC

### ** Examples

DCACs(1, DLMtool::Atlantic_mackerel, plot=TRUE) 

DCAC(1, DLMtool::Atlantic_mackerel, plot=TRUE) 

DCAC_40(1, DLMtool::Atlantic_mackerel, plot=TRUE) 

Data <- DLMtool::Atlantic_mackerel
Data@LHYear <- 2005
DCAC4010(1, Data, plot=TRUE) 

DCAC_ML(1, DLMtool::SimulatedData, plot=TRUE) 

Data <- DLMtool::Atlantic_mackerel
Data@LHYear <- 2005
DAAC(1, Data, plot=TRUE) 

Data <- DLMtool::Atlantic_mackerel
Data@LHYear <- 2005
HDAAC(1, Data, plot=TRUE) 




