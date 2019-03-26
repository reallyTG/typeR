library(sparkTable)


### Name: setParameter
### Title: Functions to interact with a Sparkline object
### Aliases: setParameter

### ** Examples

  data(pop)
  x <- pop[pop[,2]=="Insgesamt",3]
  a <- newSparkLine(values=x, pointWidth=8)
  
  a <- setParameter(a, type='values', value=sample(1:10, 15, replace=TRUE))
  getParameter(a, 'values')

  a <- setParameter(a, type='allColors',
    value=c("darkred", "darkgreen","darkblue", "white", "black", "red"))
  getParameter(a, 'allColors')

  getParameter(a, 'pointWidth')
  a <- setParameter(a, type='pointWidth', value=3)
  getParameter(a, 'pointWidth')
 
  a <- setParameter(a, type='lineWidth', value=1)
  a <- setParameter(a, type='width', value=6)
  a <- setParameter(a, type='height', value=.6)



