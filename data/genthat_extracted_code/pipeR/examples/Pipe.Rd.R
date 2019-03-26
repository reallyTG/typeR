library(pipeR)


### Name: Pipe
### Title: Create a Pipe object that stores a value and allows command
###   chaining with '$'.
### Aliases: Pipe

### ** Examples

## Not run: 
##D # Pipe as first-argument using $
##D Pipe(rnorm(100))$mean()
##D Pipe(rnorm(100))$plot(col="red")
##D 
##D # Extract the value from the Pipe object using []
##D Pipe(rnorm(100))$c(4,5) []
##D 
##D # Pipe to an exrepssion with . or symbol defined in
##D # lambda expression to represent the object
##D Pipe(rnorm(100))$.(1 + .) []
##D Pipe(rnorm(100))$.(x ~ 1 + x) []
##D 
##D # Pipe for side effect
##D Pipe(rnorm(100))$
##D   .(~ cat("number:",length(.),"\n"))$
##D   summary()
##D 
##D Pipe(rnorm(100))$
##D   .(~ x ~ cat("number:",length(x),"\n"))$
##D   summary()
##D 
##D # Assignment
##D Pipe(rnorm(100))$
##D   .(~ x)$
##D   mean()
##D 
##D Pipe(rnorm(100))$
##D   .(~ x <- length(.))$
##D   mean()
##D 
##D Pipe(rnorm(100))%
##D   .(x <- c(min(.),max(.)))$
##D   mean()
##D 
##D # Extract element with \code{.(name)}
##D Pipe(mtcars)$lm(formula = mpg ~ cyl + wt)$.(coefficients)
##D 
##D # Command chaining
##D Pipe(rnorm(100,mean=10))$
##D   log()$
##D   diff()$
##D   plot(col="red")
##D 
##D Pipe(rnorm(100))$
##D   density(kernel = "rect")$
##D   plot(col = "blue")
##D 
##D # Store an continue piping
##D pipe1 <- Pipe(rnorm(100,mean=10))$log()$diff()
##D pipe1$plot(col="red")
##D 
##D # Subsetting, extracting, and assigning
##D 
##D p <- Pipe(list(a=1,b=2))
##D p["a"]
##D p[["a"]]
##D p$a <- 2
##D p["b"] <- NULL
##D p[["a"]] <- 3
##D p[length(.)] # . = p$value
##D 
##D # Data manipulation with dplyr
##D library(dplyr)
##D Pipe(mtcars)$
##D   select(mpg,cyl,disp,hp)$
##D   filter(mpg <= median(mpg))$
##D   mutate(rmpg = mpg / max(mpg))$
##D   group_by(cyl)$
##D   do(data.frame(mean=mean(.$rmpg),median=median(.$rmpg))) []
##D 
##D # Graphics with ggvis
##D library(ggvis)
##D Pipe(mtcars)$
##D   ggvis(~ mpg, ~ wt)$
##D   layer_points()
##D 
##D # Data manipulation with rlist
##D library(rlist)
##D Pipe(list(1,2,3))$
##D   list.map(. + 1)$
##D   list.filter(. <= 5)$
##D   list.sort(.) []
##D 
##D # Lazy evaluation
##D p1 <- Pipe(mtcars)$
##D   ggvis(~ mpg, ~ wt)
##D p1$layer_points()
##D p1$layer_bars()
##D 
##D # Stored Pipe
##D f1 <- Pipe(rnorm(100))$plot
##D f1(col="red")
##D f1(col="green")
## End(Not run)



