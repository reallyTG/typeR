library(optigrab)


### Name: is_flag
### Title: Determine if/which vector element are options flags
### Aliases: is_flag which.flag

### ** Examples

  optigrab:::is_flag( c( "--foo", "bar") )
  optigrab:::is_flag( c( "--foo", "bar", "-f", "-b", "text" ) )
  
  optigrab:::which.flag( c( "--foo", "bar") )
  optigrab:::which.flag( c( "--foo", "bar", "-f", "-b", "text" ))




