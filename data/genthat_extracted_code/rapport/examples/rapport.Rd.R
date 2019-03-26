library(rapport)


### Name: rapport
### Title: Evaluate Template
### Aliases: rapport

### ** Examples

## Not run: 
##D rapport('Example', ius2008, v = "leisure")
##D rapport('Descriptives', ius2008, var = "leisure")
##D 
##D ## generating high resolution images also
##D rapport('Example', ius2008, v = "leisure", graph.hi.res = TRUE)
##D rapport.html('NormalityTest', ius2008, var = "leisure", graph.hi.res=T)
##D ## generating only high resolution image
##D rapport('Example', ius2008, v = "leisure", graph.width = 1280, graph.height = 1280)
##D ## nested templates cannot get custom setting, use custom rapport option:
##D options('graph.hi.res' = TRUE)
##D rapport('AnalyzeWizard', data=ius2008, variables=c('edu', 'game'))
## End(Not run)



