library(RProtoBuf)


### Name: clone-methods
### Title: Clone protocol buffer messages
### Aliases: clone clone-methods clone,Message-method
### Keywords: methods

### ** Examples

## Not run: 
##D # example proto file supplied with this package
##D proto.file <- system.file( "proto", "addressbook.proto", package = "RProtoBuf" )
##D 
##D # reading a proto file and creating the descriptor
##D Person <- P( "tutorial.Person", file = proto.file )
## End(Not run)
## Don't show: 
Person <- P("tutorial.Person")
## End(Don't show)

# creating a prototype message from the descriptor
sheep <- new( Person, email = "francoisromain@free.fr", id = 2 )

# cloning the sheep
newsheep <- clone( sheep )

# clone and update at once
newsheep <- clone( sheep, id = 3 )

# this can also be used as a pseudo method
sheep$clone()
sheep$clone( id = 3 )



