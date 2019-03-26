library(thriftr)


### Name: make_server
### Title: Create server side thrift API
### Aliases: make_server

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
##D Dispatcher <- R6::R6Class("Dispatcher",
##D   public = list(
##D     add = function(a, b) {
##D       print(sprintf("add -> %s + %s", a, b))
##D       return(a + b)
##D     },
##D     sub = function(a, b) {
##D       print(sprintf("sub -> %s - %s", a, b))
##D       return(a - b)
##D     },
##D     mult = function(a, b) {
##D       print(sprintf("mult -> %s * %s", a, b))
##D       return(a * b)
##D     },
##D     div = function(a, b) {
##D       print(sprintf("div -> %s / %s", a, b))
##D       return(a / b)
##D     }
##D   )
##D )
##D 
##D server <- thriftr::make_server(
##D     calc_thrift$Calculator,
##D     Dispatcher$new(),
##D     "127.0.0.1",
##D     6000)
##D 
##D print("serving...")
##D 
##D server$serve()
## End(Not run)



