library(optigrab)


### Name: opt_fill
### Title: opt_fill
### Aliases: opt_fill

### ** Examples

  defaults <- list( foo="a", bar=1 )
  
  opt_fill( defaults, opts=c( '--foo', 'command-line-foo' ))
  opt_fill( defaults, opts=c( '--foo', 'command-line-foo', '--bar', '9999' ))
 
  defaults <- as.environment(defaults)
  opt_fill( defaults, opts=c( '--foo', 'env-fill', '--bar', '555' ))
  
  str( as.list(defaults) )




