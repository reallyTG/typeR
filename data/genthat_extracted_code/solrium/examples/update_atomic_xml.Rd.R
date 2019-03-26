library(solrium)


### Name: update_atomic_xml
### Title: Atomic updates with XML data
### Aliases: update_atomic_xml

### ** Examples

## Not run: 
##D # start Solr in Cloud mode: bin/solr start -e cloud -noprompt
##D 
##D # connect
##D (conn <- SolrClient$new())
##D 
##D # create a collection
##D if (!conn$collection_exists("books")) {
##D   conn$collection_delete("books")
##D   conn$collection_create("books")
##D }
##D 
##D # Add documents
##D file <- system.file("examples", "books.xml", package = "solrium")
##D cat(readLines(file), sep = "\n")
##D conn$update_xml(file, "books")
##D 
##D # get a document
##D conn$get(ids = '978-0641723445', "books", wt = "xml")
##D 
##D # atomic update
##D body <- '
##D <add>
##D  <doc>
##D    <field name="id">978-0641723445</field>
##D    <field name="genre_s" update="set">mystery</field>
##D    <field name="pages_i" update="inc">1</field>
##D  </doc>
##D </add>'
##D conn$update_atomic_xml(body, name="books")
##D 
##D # get the document again
##D conn$get(ids = '978-0641723445', "books", wt = "xml")
##D 
##D # another atomic update
##D body <- '
##D <add>
##D  <doc>
##D    <field name="id">978-0641723445</field>
##D    <field name="price" update="remove">12.5</field>
##D  </doc>
##D </add>'
##D conn$update_atomic_xml(body, "books")
##D 
##D # get the document again
##D conn$get(ids = '978-0641723445', "books", wt = "xml")
## End(Not run)



