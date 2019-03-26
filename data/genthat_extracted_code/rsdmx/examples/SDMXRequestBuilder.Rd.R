library(rsdmx)


### Name: SDMXRequestBuilder
### Title: Class "SDMXRequestBuilder"
### Aliases: SDMXRequestBuilder
###   SDMXRequestBuilder,SDMXRequestBuilder-method SDMXRequestBuilder-class

### ** Examples

#default formatter
 myFormatter = list(
   dataflow = function(obj){
     #format some obj slots here
     return(obj)
   },
   datastructure = function(obj){
     #format some obj slots here
     return(obj)
   },
   data = function(obj){
     #format some obj slots here
     return(obj)
   }
 )

 #an handler
 #where each element of the list is a function taking as argument an object
 #of class "SDMXRequestParams"
 myHandler <- list(
   "dataflow" = function(obj){return(obj@regUrl)},
   "datastructure" = function(obj){return(obj@regUrl)},
   "data" = function(obj){return(obj@repoUrl)}
 )

 #how to create a SDMXRequestBuilder
 requestBuilder <- SDMXRequestBuilder(
   regUrl = "http://www.myorg.org/registry",
   repoUrl = "http://www.myorg.org/repository",
   accessKey = NULL,
   formatter = myFormatter, handler = myHandler, compliant = FALSE)



