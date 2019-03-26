library(rmonad)


### Name: x_to_monad
### Title: Conversions to monads
### Aliases: x_to_monad as_monad funnel combine

### ** Examples

as_monad(stop(1))
as_monad(1:10)
as_monad(5 %>>% sqrt)

## merge failing inputs 
funnel( 1:10, stop(1), sqrt(-3:3) )

## join pipelines
b2 <- letters[1:10] %>>% sqrt
b3 <- -3:6 %>>% log
1:10 %>% funnel(b2,b3) %>>%
  {data.frame(b1=.[[1]], b2=.[[2]], b3=.[[3]])}

z <- list(
  x = rnorm(10) %>>% sqrt,
  y = 1 %>>% colSums
)
combine(z)



