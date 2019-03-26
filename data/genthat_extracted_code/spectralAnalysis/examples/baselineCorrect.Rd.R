library(spectralAnalysis)


### Name: baselineCorrect
### Title: generic function to perfom baseline correction
### Aliases: baselineCorrect baselineCorrect,SpectraInTime-method

### ** Examples

 spectralEx           <-  getSpectraInTimeExample()
 plot( spectralEx )   
 timeRange            <-  range( getTimePoints( spectralEx ) )
 timesToSelect        <-  e(  seq( timeRange[1] , timeRange[2] , length.out = 5  )   )
 baselineDefault      <-  baselineCorrect( spectralEx )
 baselineHighPolynomial  <-  baselineCorrect( spectralEx, 
   method = 'modpolyfit', degree = 4 )

 # filtering with fast fourier transform, not so good on example 
 baselineLowpass         <-  baselineCorrect( spectralEx , method = "lowpass" )

 # visual inspection
 plot( baselineDefault[ timesToSelect , ] , type = "time"  )
 plot( baselineHighPolynomial[ timesToSelect , ] , type = "time"  )
 plot( baselineLowpass[ timesToSelect , ] , type = "time"  ) 




