library(spectralAnalysis)


### Name: subset-methods
### Title: Subsetting 'SpectraInTime-class'
### Aliases: subset-methods [,SpectraInTime-method
###   [,SpectraInTime,ANY,ANY,ANY-method [,SpectraInTime,ANY,ANY-method
###   [,SpectraInTime,missing,ANY-method [,SpectraInTime,ANY,missing-method
###   [,SpectraInTime,missing,missing-method
###   [,SpectraInTime,missing,ANY,ANY-method
###   [,SpectraInTime,ANY,missing,ANY-method
###   [,SpectraInTime,missing,missing,ANY-method

### ** Examples

 ### subsetting [ time , wavelength, options ]

 spectralEx                <-  getSpectraInTimeExample()
 spectraSubset             <-  spectralEx[ r( 1000 , 30000 ) , r(130 , 135 ) ]
 spectraSubsetTime         <-  spectralEx[ r( 1000 , 30000 ) ,  ]
 spectraSubsetWavelengths  <-  spectralEx[  ,  r(130 , 135 ) ]
 spectraSubsetHours        <-  spectralEx[ r( 1 , 3 ) , r(130 , 135 ) , timeUnit = "hours" ]
 closestWavelengths        <-  spectralEx[ , e( 150, 4, 300, 500 ) ] # remark only unique values 
 spectraSubsetLogical      <-  spectralEx[ getTimePoints( spectralEx ) > 300   ,
    getWavelengths( spectralEx ) <= 500 ]



