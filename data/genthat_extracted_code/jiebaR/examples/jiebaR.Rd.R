library(jiebaR)


### Name: jiebaR
### Title: A package for Chinese text segmentation
### Aliases: jiebaR jiebaR-package

### ** Examples

### Note: Can not display Chinese characters here.
## Not run: 
##D words = "hello world"
##D engine1 = worker()
##D segment(words, engine1)
##D 
##D # "./temp.txt" is a file path
##D 
##D segment("./temp.txt", engine1)
##D 
##D engine2 = worker("hmm")
##D segment("./temp.txt", engine2)
##D 
##D engine2$write = T
##D segment("./temp.txt", engine2)
##D 
##D engine3 = worker(type = "mix", dict = "dict_path",symbol = T)
##D segment("./temp.txt", engine3)
##D  
## End(Not run)
 
## Not run: 
##D ### Keyword Extraction
##D engine = worker("keywords", topn = 1)
##D keywords(words, engine)
##D 
##D ### Speech Tagging 
##D tagger = worker("tag")
##D tagging(words, tagger)
##D 
##D ### Simhash
##D simhasher = worker("simhash", topn = 1)
##D simhash(words, simhasher)
##D distance("hello world" , "hello world!" , simhasher)
##D 
##D show_dictpath()
## End(Not run)




