library(Rcpp)


### Name: exposeClass
### Title: Create an Rcpp Module to Expose a C++ Class in R
### Aliases: exposeClass
### Keywords: programming classes

### ** Examples

## Not run: 
##D ### Given the following C++ class, defined in file PopBD.h,
##D ### the call to exposeClass() shown below will write a file
##D ### src/PopBDModule.cpp containing a corresponding module definition.
##D ###   class PopBD {
##D ###     public:
##D ###       PopBD(void);
##D ###       PopBD(NumericVector initBirth, NumericVector initDeath);
##D ###   
##D ###       std::vector<double> birth;
##D ###       std::vector<double> death;
##D ###       std::vector<int> lineage;
##D ###       std::vector<long> size;
##D ###       void evolve(int);
##D ###   
##D ###   };
##D ### A file R/PopBDClass.R will be written containing the one line:
##D ###   PopBD <- setRcppClass("PopBD")
##D ###
##D ### The call below exposes the lineage and size fields, read-only,
##D ### and the evolve() method.
##D 
##D exposeClass("PopBD",
##D       constructors =
##D         list("", c("NumericVector", "NumericVector")),
##D       fields = c("lineage", "size"),
##D       methods = "evolve",
##D       header = '#include "PopBD.h"',
##D       readOnly = c("lineage", "size"))
##D 
##D ### Example with inheritance:  the class PopCount inherits from 
##D ### the previous class, and adds a method table().  It has the same
##D ### constructors as the previous class.
##D ### To expose the table() method, and the inherited evolve() method and size field:
##D 
##D exposeClass("PopCount",
##D       constructors =
##D         list("", c("NumericVector", "NumericVector")),
##D       fields = c(size = "std::vector<long>"),
##D       methods = list("table", evolve = c("void", "int")),
##D       header = '#include "PopCount.h"',
##D       readOnly = "size")
## End(Not run)



