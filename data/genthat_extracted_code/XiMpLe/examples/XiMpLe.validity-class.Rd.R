library(XiMpLe)


### Name: XiMpLe.validity,-class
### Title: Class XiMpLe.validity
### Aliases: XiMpLe.validity,-class XiMpLe.validity-class
###   is.XiMpLe.validity
### Keywords: classes

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

# this example uses recursion: the <b> node can have the "foo"
# attribute only below an <a> node; the <d> node is also only valid
# in an <a> node
XMLRecursion <- XMLValidity(
   children=list(
     a=XMLValidity(
       children=list(
         b=c("c")
       ),
       attrs=list(
         b=c("foo")
       ),
       allChildren=c("d")
     )
   ),
   attrs=list(
     b=c("bar")
   )
 )



