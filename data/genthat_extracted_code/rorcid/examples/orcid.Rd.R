library(rorcid)


### Name: orcid
### Title: Search for ORCID ID's.
### Aliases: orcid

### ** Examples

## Not run: 
##D # Get a list of names and Orcid IDs matching a name query
##D orcid(query="carl+boettiger")
##D orcid(query="given-names:carl AND family-name:boettiger")
##D 
##D # by email
##D orcid(query="email:cboettig@berkeley.edu")
##D 
##D # You can string together many search terms
##D orcid(query="johnson cardiology houston")
##D 
##D # And use boolean operators
##D orcid("johnson AND(caltech OR 'California Institute of Technology')")
##D 
##D # And you can use start and rows arguments to do pagination
##D orcid("johnson cardiology houston", start = 2, rows = 3)
##D 
##D # Use search terms, here family name
##D orcid("family-name:Sanchez", start = 4, rows = 6)
##D 
##D # Use search terms, here...
##D orcid(query="Raymond", start=0, rows=10, defType="edismax")
##D 
##D # Search using keywords
##D orcid(query="keyword:ecology")
##D 
##D # Search by DOI
##D orcid(query="10.1087/20120404")
##D 
##D # Note the difference between the first wrt the second and third
##D ## See also orcid_doi() function for searching by DOIs
##D orcid("10.1087/20120404")
##D orcid('"10.1087/20120404"')
##D ## doi
##D orcid('digital-object-ids:"10.1087/20120404"')
##D ## doi prefix
##D orcid('digital-object-ids:"10.1087/*"')
##D 
##D # search by work titles
##D orcid('work-titles:Modern developments in holography and its materials')
##D orcid('pmc:PMC3901677')
##D 
##D ## Using more complicated SOLR queries
##D 
##D # Use the qf parameter to "boost" query fields so they are ranked higher
##D # 	See how it is different than the second query without using "qf"
##D orcid(defType = "edismax", query = "Raymond", 
##D    qf = "given-names^1.0 family-name^2.0", start = 0, rows = 10)
##D orcid(query = "Raymond", start = 0, rows = 10)
##D 
##D # Use other SOLR parameters as well, here mm. Using the "mm" param, 1 and 
##D # 2 word queries require that all of the optional clauses match, but for 
##D # queries with three or more clauses one missing clause is allowed...
##D # See for more: http://bit.ly/1uyMLDQ
##D orcid(defType = "edismax", 
##D       query="keyword:ecology OR evolution OR conservation", 
##D       mm = 2, rows = 20)
## End(Not run)



