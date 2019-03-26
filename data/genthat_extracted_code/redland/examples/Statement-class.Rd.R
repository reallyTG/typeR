library(redland)


### Encoding: UTF-8

### Name: Statement-class
### Title: An RDF Statement object
### Aliases: Statement-class Statement
### Keywords: classes

### ** Examples

world <- new("World")
# Create nodes manually and add to the statment
subject <- new("Node", blank="_:myid1", world)
predicate <- new("Node", uri="http://www.example.com/isa", world)
object <- new("Node", literal="thing", world)
stmt <- new("Statement", world, subject, predicate, object)

# Create the statement specifying node values directly
stmt <- new("Statement", world, subject="http://www.example.com/myevent",
                                predicate="http://example.com/occurredAt",
                                object="Tue Feb 17 14:05:13 PST 2015")
stmt <- new("Statement", world, subject=NULL, 
                                predicate="http://www.example.com/hasAddr",
                                object="http://www.nothing.com", objectType="literal")
stmt <- new("Statement", world, subject="http://www.example.com/BobSmith", 
                                predicate="http://www.example.com/says",
                                object="¡Hola, amigo! ¿Cómo estás?", 
                                objectType="literal",
                                language="es")



