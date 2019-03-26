library(pipeR)


### Name: %>>%
### Title: Pipe an object forward
### Aliases: %>>%

### ** Examples

## Not run: 
##D # Pipe as first-argument to a function name
##D rnorm(100) %>>% plot
##D 
##D # Pipe as first-argument to a function call
##D rnorm(100) %>>% plot()
##D rnorm(100) %>>% plot(col="red")
##D rnorm(100) %>>% plot(col="red",main=length(.))
##D 
##D # Pipe as first-argument to a function call in namespace
##D # (in this case, parentheses are required)
##D rnorm(100) %>>% base::mean()
##D 
##D # Pipe to . in an expression enclosed by braces
##D representing the piped object
##D rnorm(100) %>>% { plot(.,col="red",main=length(.)) }
##D 
##D # Pipe to . in an expression enclosed by parentheses
##D representing the piped object
##D rnorm(100) %>>% (plot(.,col="red",main=length(.)))
##D 
##D # Pipe to an expression enclosed by parentheses with
##D lambda expression in the form of x ~ f(x).
##D rnorm(100) %>>% (x ~ plot(x,col="red",main=length(x)))
##D 
##D # Pipe to an expression for side effect and return
##D # the input value
##D rnorm(100) %>>%
##D   (~ cat("Number of points:",length(.))) %>>%
##D   summary
##D 
##D rnorm(100) %>>%
##D   (~ x ~ cat("Number of points:",length(x))) %>>%
##D   summary
##D 
##D # Assign the input value to a symbol in calling environment
##D # as side-effect
##D mtcars %>>%
##D   subset(mpg <= mean(mpg)) %>>%
##D   (~ sub_mtcars) %>>%
##D   summary
##D 
##D # Assign to a symbol the value calculated by lambda expression
##D # as side effect
##D mtcars %>>%
##D   (~ summary_mtcars = summary(.)) %>>%
##D   (~ lm_mtcars = df ~ lm(mpg ~ ., data = df)) %>>%
##D   subset(mpg <= mean(mpg)) %>>%
##D   summary
##D 
##D # Modifying values in calling environment
##D "col_" %>>%
##D   paste0(colnames(mtcars)) %>>%
##D   {names(mtcars) <- .}
##D 
##D rnorm(100) %>>% {
##D   num_mean <- mean(.)
##D   num_sd <- sd(.)
##D   num_var <- var(.)
##D }
##D 
##D rnorm(100) %>>% {
##D   .mean <- mean(.)
##D   .sd <- sd(.)
##D   ci <- .mean + c(-1,1) * 1.96 * .sd
##D }
##D 
##D for(i in 1:10) rnorm(i) %>>% (assign(paste0("var", i), .))
##D 
##D # Pipe for element extraction
##D mtcars %>>% (mpg)
##D 
##D # Pipe for questioning and printing
##D rnorm(100) %>>%
##D   (? summary(.)) %>>%
##D   plot(col="red")
##D 
##D mtcars %>>%
##D   "data prepared" %>>%
##D   lm(formula = mpg ~ wt + cyl) %>>%
##D   summary %>>%
##D   coef
##D 
##D mtcars %>>%
##D   ("Sample data" ? head(., 3)) %>>%
##D   lm(formula = mpg ~ wt + cyl) %>>%
##D   summary %>>%
##D   coef
##D 
##D # Pipe to an anomymous function
##D rnorm(100) %>>% (function(x) mean(x))()
##D rnorm(100) %>>% {function(x) mean(x)}()
##D 
##D # Pipe to an enclosed function to make a closure
##D z <- rnorm(100) %>>% (function(x) mean(x+.))
##D z(1) # 3
##D 
##D z <- rnorm(100) %>>% {function(x) mean(x+.)}
##D z(1) # 3
##D 
##D # Data manipulation with dplyr
##D library(dplyr)
##D iris %>>%
##D   mutate(Sepal.Size=Sepal.Length*Sepal.Width,
##D     Petal.Size=Petal.Length*Petal.Width) %>>%
##D   select(Sepal.Size,Petal.Size,Species) %>>%
##D   group_by(Species) %>>%
##D   do(arrange(.,desc(Sepal.Size+Petal.Size)) %>>% head(3))
##D 
##D # Data manipulation with rlist
##D library(rlist)
##D list(1,2,3) %>>%
##D   list.map(. + 1) %>>%
##D   list.filter(. <= 5) %>>%
##D   list.sort(.)
## End(Not run)



