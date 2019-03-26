library(annotate)


### Name: serializeEnv
### Title: A Function To Serialize Environment
### Aliases: serializeEnv serializeDataPkgEnvs
### Keywords: utilities

### ** Examples

   z <- new.env()
   assign("a", 1, env=z)
   assign("b", 2, env=z)
   assign("c", 3, env=z)
   serializeEnv(z, tempfile())



