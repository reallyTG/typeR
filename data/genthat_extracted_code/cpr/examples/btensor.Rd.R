library(cpr)


### Name: btensor
### Title: btensor
### Aliases: btensor

### ** Examples

tp <- with(mtcars,
           btensor(x = list(disp, hp, mpg),
                   iknots = list(numeric(0), c(100, 150), numeric(0)))
           )
tp
utils::str(tp)

# The equivalent matrix is could be generated as follows
tp2 <- model.matrix( ~ splines::bs(disp, intercept = TRUE) :
                       splines::bs(hp, knots = c(100, 150), intercept = TRUE) :
                       splines::bs(mpg, intercept = TRUE) + 0,
                    data = mtcars)

all.equal(tp2, unclass(tp), check.attributes = FALSE)



