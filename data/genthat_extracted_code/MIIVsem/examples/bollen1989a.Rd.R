library(MIIVsem)


### Name: bollen1989a
### Title: Industrialization-Democracy Data
### Aliases: bollen1989a
### Keywords: datasets

### ** Examples


## Not run: 
##D   model <- '
##D     Eta1 =~ y1 + y2  + y3  + y4  
##D     Eta2 =~ y5 + y6  + y7  + y8    
##D     Xi1  =~ x1 + x2 + x3 
##D     Eta1 ~ Xi1  
##D     Eta2 ~ Xi1 
##D     Eta2 ~ Eta1 
##D     y1   ~~ y5
##D     y2   ~~ y4
##D     y2   ~~ y6
##D     y3   ~~ y7
##D     y4   ~~ y8
##D     y6   ~~ y8 devtools::build_win()
##D   '
## End(Not run)




