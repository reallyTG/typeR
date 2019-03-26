library(OpenRepGrid)


### Name: alignByLoadings
### Title: Align constructs by loadings on first pricipal component.
### Aliases: alignByLoadings

### ** Examples


  # reproduction of the example in the Bell (2010)
  # constructs aligned by loadings on PC 1
  bell2010                    
  alignByLoadings(bell2010)   

  # save results
  a <- alignByLoadings(bell2010)
  
  # modify printing of resukts
  print(a, digits=5)
  
  # access results for further processing  
  names(a)
  a$cor.before
  a$loadings.before
  a$reversed
  a$cor.after
  a$loadings.after




