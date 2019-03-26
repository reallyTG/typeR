library(RDataCanvas)


### Name: DCRuntime
### Title: 'DCRuntime' will parse and extract Input/Output/Paramter, and
###   return in S3 object.
### Aliases: DCRuntime

### ** Examples

## Not run: 
##D example to use DCRuntime
##D   rt <- DCRuntime(spec_json = "/your_path/spec.json",
##D                       zetrt_json = "/some_path/zetrt.json")
##D   # Use "rt" like this:
##D   rt$Output$o1$Val
##D   rt$Input$i1$Val
##D   rt$Param$P1$Val
## End(Not run)



