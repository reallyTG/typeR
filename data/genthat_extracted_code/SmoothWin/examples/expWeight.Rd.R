library(SmoothWin)


### Name: expWeight
### Title: This function computes the smooth windowing weights
### Aliases: expWeight

### ** Examples

  par(mfrow = c(3, 1))
  # Example 1 - no merging in windows
  weight = expWeight(
    t = 1:100                                       ,
    k = 5                                           ,
    l = 10                                          ,
    m = c(25, 50, 75)                               ,
    plot = TRUE                                     ,
    ### Passed parameters to the plot function
    type = 'l'                                      ,
    lty = 2                                         ,
    lwd = 3                                         ,
    main = 'If windows do not intersect, then wont merge!'
  )
  # Example 2 - merging in windows
  weight = expWeight(
    t = 1:100                                       ,
    k = 5                                           ,
    l = 15                                          ,
    m = c(25, 50, 75)                               ,
    plot = TRUE                                     ,
    ### Passed parameters to the plot function
    type = 'l'                                      ,
    lty = 2                                         ,
    lwd = 3                                         ,
    main = 'If windows intersect, then merge!'
  )
  # Example 3 - partial merging in windows
  weight = expWeight(
    t = 1:100                                       ,
    k = 1                                           ,
    l = 12                                          ,
    m = c(25, 50, 75)                               ,
    plot = TRUE                                     ,
    ### Passed parameters to the plot function
    type = 'l'                                      ,
    lty = 2                                         ,
    lwd = 3                                         ,
    main = 'If windows intersect with small k, then partially merge!'
  )



