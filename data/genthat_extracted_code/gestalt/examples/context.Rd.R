library(gestalt)


### Name: context
### Title: Run an Action in an Ordered Context
### Aliases: context let run

### ** Examples

# Miles-per-gallon of big cars
mtcars$mpg[mtcars$cyl == 8 & mtcars$disp > 350]
run(mtcars, mpg[cyl == 8 & disp > 350])
run(mtcars, mpg[big_cars], big_cars = cyl == 8 & disp > 350)

# 'let()' makes a reusable local context for big cars
cars <- let(mtcars, big = cyl == 8 & disp > 350)

eval(quote(mpg[big]), cars)  # Quoting restricts name lookup to 'cars'
run(cars, mpg[big])          # The same, but shorter and more transparent

run(cars, wt[big])
mtcars$wt[mtcars$cyl == 8 & mtcars$disp > 350]

# Precedence of names is from right to left (“bottom-up”):
a <- 1000
run(`_expr` = a + b, a = 1, b = a + 2)    # 4: all references are local
run(list(a = 1), a + b, b = a + 2)        # 4: 'b' references local 'a'
run(let(a = 1, b = a + 2), a + b)         # 4: 'b' references local 'a'
run(let(a = 1, b = a + 2), a + b, a = 0)  # 3: latter 'a' takes precedence
run(list(a = 1, b = a + 2), a + b)        # 1003: 'b' references global 'a'

# Bound expressions are lazily evaluated: no error unless 'x' is referenced
run(`_expr` = "S’all good, man.", x = stop("!"))
run(let(x = stop("!")), "S’all good, man.")
let(x = stop("!"))    # Environment binding 'x'
## No test: 
let(x = stop("!"))$x  # Error: !
## End(No test)

# Quasiquotation is supported
a <- 1
run(let(a = 2), a + !!a)               #> [1] 3
run(let(a = 1 + !!a, b = a), c(a, b))  #> [1] 2 2




