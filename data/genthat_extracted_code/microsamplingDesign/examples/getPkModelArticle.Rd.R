library(microsamplingDesign)


### Name: getPkModelArticle
### Title: reproduce the example of the article of Helen Barnet et al.
### Aliases: getPkModelArticle

### ** Examples

  model       <-  getPkModelArticle()
  summary( model )
  testData    <-    getPkData( model , 1:12 , nSubjectsPerScheme = 3 , nSamples = 7 )
  plotObject( model , times = 0:12  )
   plotAverageRat( model , doseZero = 100 , timePoints = seq(0,12,0.5) )



