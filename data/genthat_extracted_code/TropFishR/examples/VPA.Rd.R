library(TropFishR)


### Name: VPA
### Title: Virtual Population Analysis (VPA)
### Aliases: VPA
### Keywords: F VPA biomass cohort function mortality stock

### ** Examples

#_______________________________________________
# Virtual Popuation Analysis with age-composition data
data(whiting)
output <- VPA(param = whiting, catch_columns = 1, terminalE = 0.5, analysis_type = "VPA")
plot(output)
#_______________________________________________
# Pope's Cohort Analysis with age-composition data
data(whiting)
VPA(whiting, terminalE = 0.5, catch_columns = 3, analysis_type = "CA",
   plot= TRUE, plus_group = TRUE)

#_______________________________________________
# Virtual population analysis with length-composition data
data(hake)
VPA(hake, terminalE = 0.5, analysis_type = "VPA", plot = TRUE,
    catch_unit = "'000", plus_group = TRUE)
#_______________________________________________
# Jones's Cohort Analysis with length-composition data
data(hake)
VPA(hake, terminalE = 0.5, analysis_type = "CA", plot = TRUE,
   catch_unit = "'000", plus_group = TRUE)




