library(microsamplingDesign)


### Name: plotMMCurve
### Title: plot Michealis-Menten curve for either capacity dependent
###   absorption or clearance
### Aliases: plotMMCurve

### ** Examples

  plotMMCurve( dataInput = getMMCurve( seq(0, 5 , 0.01 ) ,
      Vmax = 5 , kappaMM = 0.3 ) , parameter = "absorption" )
  plotMMCurve( dataInput = getMMCurve( seq(0, 5 , 0.01 ) ,
      Vmax = 5 , kappaMM = 0.3 , constantValue = 4 ) , parameter = "absorption" ) 
  plotMMCurve( dataInput = getMMCurve( seq(0, 1 , 0.01 ) ,
      Vmax = 2 , kappaMM = 0.3 ) , parameter = "clearance" )
  plotMMCurve( dataInput = getMMCurve( seq(0, 1 , 0.01 ) ,
       Vmax = 2 , kappaMM = 0.3 , constantValue = 1.5 ) , parameter = "clearance" )  



