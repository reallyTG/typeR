library(RProtoBuf)


### Name: Message-class
### Title: Class "Message"
### Aliases: Message-class as.character,Message-method $<-,Message-method
###   $,Message-method [[,Message-method [[<-,Message-method
###   serialize,Message-method show,Message-method update,Message-method
###   length,Message-method names,Message-method str,Message-method
###   toString,Message-method identical,Message,Message-method
###   ==,Message,Message-method !=,Message,Message-method
###   all.equal,Message,Message-method getExtension,Message-method
###   setExtension,Message-method getExtension setExtension
### Keywords: classes

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

PhoneNumber <- P( "tutorial.Person.PhoneNumber" )

# creating a prototype message from the descriptor
p <- new( Person )
p$email # not set, returns default value
p$id    # not set, returns default value
as.character( p ) # empty
has( p, "email" ) # is the "email" field set
has( p, "phone" ) # is the "email" field set
length( p )       # number of fields actually set

# update several fields at once
romain <- update( new( Person ), 
	email = "francoisromain@free.fr", 
	id = 1, 
	name = "Romain Francois", 
	phone = new( PhoneNumber , number = "+33(0)...", type = "MOBILE" )
	)

# supply parameters to the constructor
dirk <- new( Person, 
	email = "edd@debian.org", 
	id = 2, 
	name = "Dirk Eddelbuettel" ) 
# update the phone repeated field with a list of PhoneNumber messages
dirk$phone <- list( 
	new( PhoneNumber , number = "+01...", type = "MOBILE" ), 
	new( PhoneNumber , number = "+01...", type = "HOME" ) )
	
# with/within style
saptarshi <- within( new(Person), {
	id <- 3
	name <- "Saptarshi Guha"
	email <- "saptarshi.guha@gmail.com" 
} )

# make an addressbook
book <- new( tutorial.AddressBook, person = list( romain, dirk, saptarshi ) )

# serialize the message to a file
tf <- tempfile( )
serialize( book, tf )

# the payload of the message
serialize( book, NULL )

# read the file into a new message
m <- tutorial.AddressBook$read( tf )
writeLines( as.character( m ) )
sapply( m$person, function(p) p$name )



