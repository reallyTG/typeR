library(rCMA)


### Name: cmaNew
### Title: Create a new CMA-ES Java object.
### Aliases: cmaNew

### ** Examples

## show how element initialX can be inferred from attribute props:
   ## (see  cmaEvalMeanX-documentation for further details on .jcall and its argument "S")
   cma <- cmaNew();
   props <- attr(cma,"props");
   initialX = rJava::.jcall(props,"S","getProperty","initialX");
   print(initialX);



