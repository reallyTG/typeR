library(dynamicGraph)


### Name: dg.Test-class
### Title: Class dg.Test
### Aliases: dg.Test-class label,dg.Test-method width,dg.Test-method
###   initialize,dg.Test-method setSlots,dg.Test-method
###   newDefaultTestObject
### Keywords: classes

### ** Examples

# Part of the example "defaultObjects" of demo:

setClass("your.Test", 
         representation(name = "character",
                        deviance = "numeric", df = "numeric", p = "numeric"))

setMethod("setSlots", "your.Test",
          function(object, arguments) { 
            for (i in seq(along = arguments)) {
              name <- names(arguments)[i]
              if (is.element(name, slotNames(object)))
                slot(object, name) <- arguments[[i]]
              else
                message(paste("Argument '", name, "' not valid slot of '", 
                              class(object), "', thus ignored.",
                              sep = "")) }
            return(object)
          })

setMethod("initialize", "your.Test",
          function(.Object, ...) {
              # print(c("initialize", "your.Test", class(.Object)))
              Args <- list(...)
              if (!is.element("df", names(Args)) || 
                  !is.element("deviance", names(Args))) {
                Args <- (Args[!names(Args) == "df"])
                Args <- (Args[!names(Args) == "deviance"])
                .Object@df <- round(runif(1, 1, 25))
                .Object@deviance <- rchisq(1, .Object@df)
                .Object@p <- 1 - pchisq(.Object@deviance, .Object@df)
                message("Just generating a random test!!!!")
              }
              .Object <- setSlots(.Object, Args)
              return(.Object)
            }
          )


if (!isGeneric("label") && !isGeneric("label", where = 2)) {
  if (is.function("label"))
    fun <- label
  else
    fun <- function(object) standardGeneric("label")
  setGeneric("label", fun)
}

setMethod("label", "your.Test",
          function(object) format(object@p, digits = 4))

if (!isGeneric("width") && !isGeneric("width", where = 2)) {
  if (is.function("width"))
    fun <- width
  else
    fun <- function(object) standardGeneric("width")
  setGeneric("width", fun)
}

setMethod("width", "your.Test",
          function(object) round(2 + 5 * (1 - object@p)))

new("your.Test", name = "TestObject")



