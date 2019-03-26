library(pRoloc)


### Name: AnnotationParams-class
### Title: Class '"AnnotationParams"'
### Aliases: class:AnnotationParams AnnotationParams AnnotationParams-class
###   show,AnnotationParams-method AnnotationParams setAnnotationParams
###   getAnnotationParams dunkley2006params andy2011params
### Keywords: classes

### ** Examples

data(andy2011params)
andy2011params
data(dunkley2006params)
dunkley2006params

try(setAnnotationParams(inputs = c("nomatch1", "nomatch2")))
setAnnotationParams(inputs = c("Homo sapiens",
                        "UniProtKB/Swiss-Prot ID"))
getAnnotationParams()



