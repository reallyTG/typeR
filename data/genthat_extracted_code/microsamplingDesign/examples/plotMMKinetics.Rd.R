library(microsamplingDesign)


### Name: plotMMKinetics
### Title: plot MM kinetics of both absorption and clearance
### Aliases: plotMMKinetics

### ** Examples

   plotMMKinetics( pkModel = getExamplePkModel() , 
      doseRange = seq( 0 , 5 , 0.1 ) , 
      concentrationRange = seq( 0 , 2.5 , 0.1  ) )
   plotMMKinetics( pkModel = getExamplePkModel() , 
       doseRange = seq( 0 , 5 , 0.1 ) , 
       concentrationRange = seq( 0 , 2.5 , 0.1  ) , 
       clearanceYRange = c( 0 , 50 ) , absorptionYRange = c( 0 , 10 )  )



