library(cleanNLP)


### Name: cleanNLP-package
### Title: cleanNLP: A Tidy Data Model for Natural Language Processing
### Aliases: cleanNLP cleanNLP-package

### ** Examples


## Not run: 
##D # load the annotation engine (can also use spaCy and coreNLP backends)
##D setup_tokenizers_backend()
##D init_backend(type = "tokenizers")
##D 
##D # annotate your text
##D annotation <- run_annotators("path/to/corpus/directory")
##D 
##D # pull off data tables
##D token <- cnlp_get_token(annotation)
##D dependency <- cnlp_get_dependency(annotation)
##D document <- cnlp_get_document(annotation)
##D coreference <- cnlp_get_coreference(annotation)
##D entity <- cnlp_get_entity(annotation)
##D sentiment <- cnlp_get_sentence(annotation)
##D vector <- cnlp_get_vector(annotation)
## End(Not run)




