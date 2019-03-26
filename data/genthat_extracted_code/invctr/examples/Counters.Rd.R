library(invctr)


### Name: Counters
### Title: Counters
### Aliases: Counters %+-% %++%

### ** Examples

## Not run: 
##D # Signed increment
##D # Notice the difference between passing an object and a value for counter
##D 
##D # Value
##D (10 %+-% -5)
##D (10 %+-% -5)
##D 
##D # Object
##D i <- 10
##D (i %+-% -5)
##D (i %+-% -5)
##D 
##D # This means we can use the infix in a while ... statement
##D # WARNING: As is the case for any while ... statement, be careful not to create an infinite loop!
##D 
##D i <- 10
##D while(i > -5){
##D   i %+-% -5
##D   print(i)
##D }
##D 
##D 
##D # Non-negative increment
##D # Notice the difference between passing an object and a value for counter
##D 
##D # Value
##D (0 %++% 5)
##D (0 %++% 5)
##D 
##D # Object
##D i <- 0
##D (i %++% 5)
##D (i %++% 5)
##D 
##D # This means we can use the infix in a while ... statement
##D # WARNING: As is the case for any while ... statement, be careful not to create an infinite loop!
##D 
##D i <- 0
##D while(i < 20){
##D i %++% 5
##D print(i)
##D }
## End(Not run)




