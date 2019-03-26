library(hedgehog)


### Name: forall
### Title: Hedgehog property test
### Aliases: forall

### ** Examples

test_that( "Reverse and concatenate symmetry",
  forall( list( as = gen.c( gen.element(1:100) )
              , bs = gen.c( gen.element(1:100) ))
        , function( as, bs )
            expect_identical ( rev(c(as, bs)), c(rev(bs), rev(as)))
  )
)

# False example showing minimum shrink:
## Not run: 
##D test_that( "Reverse is identity",
##D   forall ( gen.c( gen.element(1:100)), function(x) { expect_identical ( rev(x), c(x) ) } )
##D )
## End(Not run)
# Falsifiable after 1 tests, and 5 shrinks
# Predicate is falsifiable

# Counterexample:
# [1] 1 2




