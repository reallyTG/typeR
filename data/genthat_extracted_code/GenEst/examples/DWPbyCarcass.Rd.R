library(GenEst)


### Name: DWPbyCarcass
### Title: Assign DWP value to each carcass
### Aliases: DWPbyCarcass

### ** Examples

 data(mock)
 DWP <- DWPbyCarcass(data_DWP = mock$DWP, data_CO = mock$CO,
          sizeCol = "Size", unitCol = "Unit")
 DWP <- DWPbyCarcass(data_DWP = mock$DWP, data_CO = mock$CO,
          unitCol = "Unit", DWPCol = "S")




