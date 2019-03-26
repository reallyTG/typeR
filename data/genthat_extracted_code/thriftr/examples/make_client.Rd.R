library(thriftr)


### Name: make_client
### Title: Create client side thrift API
### Aliases: make_client

### ** Examples

## Not run: 
##D # File calc.thrift content:
##D # service Calculator {
##D #   i32 add(1:i32 a, 2:i32 b);
##D #   i32 sub(1:i32 a, 2:i32 b);
##D #   i32 mult(1:i32 a, 2:i32 b);
##D #   i32 div(1:i32 a, 2:i32 b);
##D # }
##D #
##D 
##D calc_thrift <- thriftr::t_load("calc.thrift", module_name="calc_thrift")
##D 
##D cal <- thriftr::make_client(
##D     calc_thrift$Calculator,
##D     "127.0.0.1",
##D     6000)
##D 
##D a <- cal$mult(5, 2)
##D b <- cal$sub(7, 3)
##D c <- cal$sub(6, 4)
##D d <- cal$mult(b, 10)
##D e <- cal$add(a, d)
##D f <- cal$div(e, c)
##D print(f)
## End(Not run)



