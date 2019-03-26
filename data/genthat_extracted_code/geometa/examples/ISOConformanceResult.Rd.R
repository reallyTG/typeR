library(geometa)


### Name: ISOConformanceResult
### Title: ISOConformanceResult
### Aliases: ISOConformanceResult
### Keywords: ISO conformance result

### ** Examples

 md <- ISOConformanceResult$new()
 spec <- ISOCitation$new()
 spec$setTitle("specification title")
 spec$setAlternateTitle("specification alternate title")
 d <- ISODate$new()
 d$setDate(ISOdate(2015, 1, 1, 1))
 d$setDateType("publication")
 spec$addDate(d)
 md$setSpecification(spec)
 md$setExplanation("some explanation about the conformance")
 md$setPass(TRUE)
 xml <- md$encode()
 



