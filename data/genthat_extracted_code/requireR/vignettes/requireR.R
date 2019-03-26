## ---- include = FALSE----------------------------------------------------
source("../R/requireR.R")

## ------------------------------------------------------------------------
#hello.R
requireR(function() {
  "hello"
})

## ------------------------------------------------------------------------
#world.R
requireR(function() {
  "world"
})

## ------------------------------------------------------------------------
requireR(
  "hello.R",
  "world.R",
  function(hello, world) {
    paste(hello, world)
})

## ------------------------------------------------------------------------
hello <- requireR("hello.R")
world <- requireR("world.R")
paste(hello, world)

