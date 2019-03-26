## ----setup, echo = FALSE, message = FALSE--------------------------------
library(hedgehog)
set.seed(1014)
snoc <- function (xs, x) {
  unlist ( list ( xs, list( x)) , recursive = F )
}

## ----echo = T, message = F-----------------------------------------------
refs <- setRefClass("Refs",
    fields = list(
        num = "numeric"
      , refs = "list"
      )
  , methods = list(
        initialize = function() .self$reset()
      , newRef = function() {
        .self$num <- .self$num + 1
        .self$refs[[.self$num]] <- 0
        return ( .self$num )
      }
      , readRef = function(i) {
        return ( .self$refs[[i]] )
      }
      , writeRef = function(i, a) {
        .self$refs[[i]] <- a
        invisible(NULL)
      }
      , reset = function() {
        .self$num = 0
        .self$refs = list()
        invisible(NULL)
      }
    )
)
grefs <- refs$new()

## ----echo = T, message = F-----------------------------------------------
list(key = 2, val = 0)

## ----echo = T, message = F-----------------------------------------------
new  <- command ( "New",
    generator = function( state ) list()
  , execute   = function() grefs$newRef()
  , update    = function( state, output )
      snoc( state, list(key = output, val = 0))
  )

## ----echo = T, message = F-----------------------------------------------
initialmodel <- list()

## ----echo = T, message = F-----------------------------------------------
test_that( "Registry State Machine Model",
  forall( gen.actions ( initialmodel, list(new) ), function( actions ) {
    grefs$reset()
    expect_sequential( initialmodel, actions )
  })
)

## ----echo = T, message = F-----------------------------------------------
read <- command ( "Read",
    generator = function( state ) {
      if ( length(state) == 0 )
        return(NULL)
      list(
        key = gen.with(gen.element( state ), function(i) i$key )
      )}
  , require = function( state, key )
      !is.null ( Find( function( proc ) { proc$key == key } , state ) )
  , execute = function( key ) grefs$readRef(key)
  , ensure  = function( state, output, key ) {
      expected <- Find( function( proc ) { proc$key == key } , state )$val
      expect_equal( expected, output)
    }
  )

## ----echo = T, message = F-----------------------------------------------
write <- command ( "Write",
    generator = function( state ) {
      if ( length(state) == 0 )
        return(NULL)
      list (
        key = gen.map( function(i) i$key, gen.element( state ))
      , val = gen.int(10)
      )}
  , require = function( state, key, val )
      !is.null ( Find( function( proc ) { proc$key == key } , state ) )
  , execute = function( key, val ) grefs$writeRef( key, val )
  , update  = function( state, output, key, val )
      lapply( state, function(proc)
        if (proc$key == key) list(key = proc$key, val = val) else proc
      )
  )

## ----echo = T, message = F-----------------------------------------------
test_that( "Registry State Machine Model",
  forall( gen.actions ( initialmodel, list(new, read, write) ), function( actions ) {
    grefs$reset()
    expect_sequential( initialmodel, actions )
  })
)

## ----echo = T, message = F-----------------------------------------------
writeIncorrect <- command ( "Write (Broken)",
    generator = function( state ) {
      if ( length(state) == 0 )
        return(NULL)
      list (
        key = gen.with( gen.element( state ), function(i) i$key)
      , val = gen.int(10)
      )}
  , require = function( state, key, val )
      !is.null ( Find( function( proc ) { proc$key == key } , state ) )
  , execute = function( key, val ) grefs$writeRef( key, val + 1)
  , update  = function( state, output, key, val )
      lapply( state, function(proc)
        if (proc$key == key) list(key = proc$key, val = val) else proc
      )
  )

## ----echo = T, message = F, error=TRUE-----------------------------------
test_that( "Registry State Machine Model",
  forall( gen.actions ( initialmodel, list(new, read, write, writeIncorrect) ), function( actions ) {
    grefs$reset()
    expect_sequential( initialmodel, actions )
  })
)

