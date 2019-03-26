library(gestalt)


### Name: posure
### Title: Variable Composite Functions
### Aliases: posure

### ** Examples

foo <- posure(b = 2, n ~ {
  sample %>>>% log(base = b) %>>>% rep(n)
})

# A posure is a composite function with dependencies:
foo

set.seed(1)
foo(2^(1:10), size = 2, n = 3)
#> [1] 3 4 3 4 3 4

set.seed(1)
rep(log(sample(2^(1:10), size = 2), base = 2), 3)
#> [1] 3 4 3 4 3 4

# However, a 'posure()' does the composition upfront, so it is faster
# than the equivalent function defined using the magrittr pipe:

library(magrittr)  # Provides the pipe %>%

foo_pipe <- function(..., b = 2, n) {
  sample(...) %>% log(base = b) %>% rep(n)
}

set.seed(1)
foo_pipe(2^(1:10), size = 2, n = 3)
#> [1] 3 4 3 4 3 4

# Moreover, posures are safer than functions defined using the pipe,
# because '%>>>%' validates constituent functions:
## No test: 
posure(b = 2, n ~ log(Base = b) %>>>% rep(n))
# Error: unused argument (Base = b)

posure(b = 2 ~ my_sample %>>>% log(base = b))
# Error: object 'my_sample' not found
## End(No test)




