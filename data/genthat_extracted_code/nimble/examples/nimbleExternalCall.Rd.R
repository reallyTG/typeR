library(nimble)


### Name: nimbleExternalCall
### Title: Create a nimbleFunction that wraps a call to external compiled
###   code
### Aliases: nimbleExternalCall

### ** Examples

## Not run: 
##D sink('add1.h')
##D cat('
##D  extern "C" {
##D  void my_internal_function(double *p, double*ans, int n);
##D  }
##D ')
##D sink()
##D sink('add1.cpp') 
##D cat('
##D  #include <cstdio>
##D  #include "add1.h"
##D  void my_internal_function(double *p, double *ans, int n) {
##D    printf("In my_internal_function\\n");
##D      /* cat reduces the double slash to single slash */ 
##D    for(int i = 0; i < n; i++) 
##D      ans[i] = p[i] + 1.0;
##D  }
##D ')
##D sink()
##D system('g++ add1.cpp -c -o add1.o')
##D Radd1 <- nimbleExternalCall(function(x = double(1), ans = double(1),
##D n = integer()){}, Cfun =  'my_internal_function',
##D headerFile = file.path(getwd(), 'add1.h'), returnType = void(),
##D oFile = file.path(getwd(), 'add1.o'))
##D ## If you need to use a function with non-scalar return object in model code,
##D ## you can wrap it  in another nimbleFunction like this:
##D model_add1 <- nimbleFunction(
##D      run = function(x = double(1)) {
##D          ans <- numeric(length(x))
##D          Radd1(x, ans, length(x))
##D          return(ans)
##D          returnType(double(1))
##D      })
##D demoCode <- nimbleCode({
##D      for(i in 1:4) {x[i] ~ dnorm(0,1)} ## just to get a vector
##D      y[1:4] <- model_add1(x[1:4])
##D })
##D demoModel <- nimbleModel(demoCode, inits = list(x = rnorm(4)),
##D check = FALSE, calculate = FALSE)
##D CdemoModel <- compileNimble(demoModel, showCompilerOutput = TRUE)
## End(Not run)



