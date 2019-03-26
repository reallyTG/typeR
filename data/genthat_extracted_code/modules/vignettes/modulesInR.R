## ---- results='asis', echo=FALSE-----------------------------------------
cat(gsub("\\n   ", "", packageDescription("modules", fields = "Description")))

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("modules")

## ---- eval=FALSE---------------------------------------------------------
#  if (require("devtools")) install_github("wahani/modules")

## ------------------------------------------------------------------------
library("modules")
m <- module({
  boringFunction <- function() "boring output"
})
m$boringFunction()

## ----error=TRUE----------------------------------------------------------
x <- "hey"
m <- module({
  someFunction <- function() x
})
m$someFunction()

## ------------------------------------------------------------------------
m <- module({
  functionWithDep <- function(x) stats::median(x)
})
m$functionWithDep(1:10)

## ------------------------------------------------------------------------
m <- module({

  import("stats", "median") # make median from package stats available

  functionWithDep <- function(x) median(x)

})
m$functionWithDep(1:10)

## ------------------------------------------------------------------------
m <- module({

  import("stats")

  functionWithDep <- function(x) median(x)

})
m$functionWithDep(1:10)

## ------------------------------------------------------------------------
m <- module({

  export("fun")

  fun <- identity # public
  privateFunction <- identity

  # .named are always private
  .privateFunction <- identity

})

names(m)

## ----error=TRUE----------------------------------------------------------
library("parallel")
dependency <- identity
fun <- function(x) dependency(x) 

cl <- makeCluster(2)
clusterMap(cl, fun, 1:2)
stopCluster(cl)

## ------------------------------------------------------------------------
m <- module({
  dependency <- identity
  fun <- function(x) dependency(x) 
})

cl <- makeCluster(2)
clusterMap(cl, m$fun, 1:2)
stopCluster(cl)

## ------------------------------------------------------------------------
code <- "
import('stats', 'median')
functionWithDep <- function(x) median(x)
"

fileName <- tempfile(fileext = ".R")
writeLines(code, fileName)

## ------------------------------------------------------------------------
m <- use(fileName)
m$functionWithDep(1:2)

## ------------------------------------------------------------------------
m <- module({

  import("stats", "median")
  import("modules", "module")

  anotherModule <- module({
    fun <- function(x) median(x)
  })

})

m$anotherModule$fun(1:2)

## ------------------------------------------------------------------------
m <- function(param) {
  module(topEncl = environment(), {
    fun <- function() param
  })
}

m(1)$fun()

## ------------------------------------------------------------------------
module({
  fun <- function(x) {
    ## A function for illustrating documentation
    ## x (numeric)
    x
  }
})

## ------------------------------------------------------------------------
m <- module({
  .generic <- function(x) UseMethod("generic")
  generic.numeric <- function(x) cat("method for x ~ numeric")
  generic <- function(x) .generic(x)
})
m$generic(1)

## ------------------------------------------------------------------------
mutableModule <- module({
  .num <- NULL
  get <- function() .num
  set <- function(val) .num <<- val
})
mutableModule$get()
mutableModule$set(2)

## ------------------------------------------------------------------------
complectModule <- module({
  use(.GlobalEnv$mutableModule, attach = TRUE)
  getNum <- function() get()
  set(3)
})
mutableModule$get()
complectModule$getNum()

## ------------------------------------------------------------------------
complectModule <- module({
  use(.GlobalEnv$mutableModule, attach = TRUE, reInit = FALSE)
  getNum <- function() get()
  set(3)
})
mutableModule$get()
complectModule$getNum()

## ------------------------------------------------------------------------
complectModule <- module({
  expose(.GlobalEnv$mutableModule, reInit = TRUE)
  set(4)
})
mutableModule$get()
complectModule$get()

## ------------------------------------------------------------------------
complectModule <- module({
  expose(.GlobalEnv$mutableModule, reInit = FALSE)
  set(1)
})
mutableModule$get()
complectModule$get()

