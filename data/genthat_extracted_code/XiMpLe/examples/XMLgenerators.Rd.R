library(XiMpLe)


### Name: XMLgenerators
### Title: Generate XML generator functions from XiMpLe.valisity object
### Aliases: XMLgenerators XMLgenerators,-methods
###   XMLgenerators,XiMpLe.validity-method
###   XMLgenerators,XiMpLe.validity-method
### Keywords: methods

### ** Examples

HTMLish <- XMLValidity(
   children=list(
     body=c("a", "p", "ol", "ul", "strong"),
     head=c("title"),
     html=c("head", "body"),
     li=c("a", "br", "strong"),
     ol=c("li"),
     p=c("a", "br", "ol", "ul", "strong"),
     ul=c("li")
   ),
   attrs=list(
     a=c("href", "name"),
     p=c("align")
   ),
   allChildren=c("!--"),
   allAttrs=c("id", "class"),
   empty=c("br")
)
XMLgenerators(HTMLish)



