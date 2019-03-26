library(hedgehog)


### Name: hedgehog
### Title: Property based testing in R
### Aliases: hedgehog hedgehog-package

### ** Examples

library(hedgehog)
test_that( "Reverse and concatenate symmetry",
  forall( list( as = gen.c( gen.element(1:100) )
              , bs = gen.c( gen.element(1:100) ))
        , function( as, bs )
            expect_identical ( rev(c(as, bs)), c(rev(bs), rev(as)))
  )
)



