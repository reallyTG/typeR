library(evolqg)


### Name: CalcR2CvCorrected
### Title: Corrected integration value
### Aliases: CalcR2CvCorrected CalcR2CvCorrected.default
###   CalcR2CvCorrected.lm
### Keywords: correlation integration

### ** Examples

integration.dist = CalcR2CvCorrected(iris[,1:4])

#adjusted values
integration.dist[[1]]

#ploting models
library(ggplot2)
ggplot(integration.dist$dist, aes(r2, mean_cv)) + geom_point() + 
       geom_smooth(method = 'lm', color= 'black') + theme_bw()
       
ggplot(integration.dist$dist, aes(eVals_cv, mean_cv)) + geom_point() + 
       geom_smooth(method = 'lm', color= 'black') + theme_bw()



