library(rplos)


### Name: plossubject
### Title: Search PLoS Journals subjects.
### Aliases: plossubject

### ** Examples

## Not run: 
##D plossubject('marine ecology', limit = 5)
##D plossubject(q='marine ecology',  fl = c('id','journal','title'), limit = 20)
##D plossubject(q='marine ecology', fl = c('id','journal'),
##D    fq='doc_type:full', limit = 9)
##D plossubject(q='marine ecology', fl = c('id','journal'),
##D    fq=list('doc_type:full','!article_type_facet:"Issue%20Image"'),
##D    limit = 9)
## End(Not run)



