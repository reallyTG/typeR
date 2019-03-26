library(translateR)


### Name: enron
### Title: Small subset of Enron email corpus
### Aliases: enron
### Keywords: datasets

### ** Examples

## Not run: 
##D # Load example data. Three columns, the text
##D # content ('email') and two metadata
##D # fields (date and subject)
##D data(enron)
##D 
##D # Google, translate column in dataset
##D google.dataset.out <- translate(dataset = enron,
##D                                 content.field = 'email',
##D                                 google.api.key = my.api.key,
##D                                 source.lang = 'en',
##D                                 target.lang = 'de')
##D 
##D # Google, translate vector
##D google.vector.out <- translate(content.vec = enron$email,
##D                                google.api.key = my.api.key,
##D                                source.lang = 'en',
##D                                target.lang = 'de')
##D 
##D # Microsoft, translate column in dataset
##D google.dataset.out <- translate(dataset = enron,
##D                                 content.field = 'email',
##D                                 microsoft.client.id = my.client.id,
##D                                 microsoft.client.secret =
##D                                           my.client.secret,
##D                                 source.lang = 'en',
##D                                 target.lang = 'de')
##D 
##D # Microsoft, translate vector
##D google.vector.out <- translate(content.vec = enron$email,
##D                                microsoft.client.id = my.client.id,
##D                                microsoft.client.secret =
##D                                          my.client.secret,
##D                                source.lang = 'en',
##D                                target.lang = 'de')
## End(Not run)



