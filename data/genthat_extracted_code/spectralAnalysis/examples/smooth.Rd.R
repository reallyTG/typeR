library(spectralAnalysis)


### Name: smooth
### Title: generic smoothing function
### Aliases: smooth smooth,SpectraInTime-method

### ** Examples

     spectralEx     <-  getSpectraInTimeExample()
    smoothDefault   <-  smooth( spectralEx )
    timeRange       <-  range( getTimePoints( spectralEx ))
    timesToSelect   <-  e( seq( timeRange[1] , timeRange[2] , length.out = 5  )  )
    # plot( smoothDefault  )
    # plot( smoothDefault[ timesToSelect , ] , type = "time")
    smoothALot      <-  smooth( spectralEx ,  order = 2 , window = 301  ) 
    # plot( smoothALot )
    # plot( smoothALot[  timesToSelect , ] , type = "time" )
    derivative1     <-  smooth( spectralEx , derivative = 1 )
    # plot( derivative1 )
    # plot( derivative1[  timesToSelect ,] , type = "time" )
    
    derivative2     <-  smooth( spectralEx , derivative = 2 )
    # plot(  derivative2 )
    # plot( derivative2[  timesToSelect , ] , type = "time" )
    



