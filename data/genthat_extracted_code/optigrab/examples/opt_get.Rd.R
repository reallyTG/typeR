library(optigrab)


### Name: opt_get
### Title: Get option's values from the command-line
### Aliases: opt_get opt_get_gnu opt_get_ms opt_get_java opt_grab

### ** Examples

  opts <- c( '--foo', 'bar' )
 
  opt_get('foo')
  opt_get( c('foo'), opts=opts )    
  opt_grab( c('--foo'), opts=opts ) 
  
  opt_get_ms( c('foo'), opts=c('/foo', 'bar' ) )
  opt_get_java( c('foo'), opts=c('-foo', 'bar' ) )
  
  
  # Using pipes:
  ## Not run: 
##D     c('foo', 'f') %>% opt_get('bar')
##D   
## End(Not run)
  



