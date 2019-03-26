library(stylo)


### Name: make.frequency.list
### Title: Make List of the Most Frequent Elements (e.g. Words)
### Aliases: make.frequency.list

### ** Examples

# assume there is a text:
text = "Mr. Sherlock Holmes, who was usually very late in the mornings, 
       save upon those not infrequent occasions when he was up all night, 
       was seated at the breakfast table. I stood upon the hearth-rug and 
       picked up the stick which our visitor had left behind him the night 
       before. It was a fine, thick piece of wood, bulbous-headed, of the 
       sort which is known as a \"Penang lawyer.\""

# this text can be converted into vector of words:
words = txt.to.words(text)

# an avanced tokenizer is available via the function 'txt.to.words.ext':
words2 = txt.to.words.ext(text, language = "English.all")

# a frequency list (just words):
make.frequency.list(words)
make.frequency.list(words2)

# a frequency list with the numeric values
make.frequency.list(words2, value = TRUE)

## Not run: 
##D # #####################################
##D # using the function with large text collections
##D 
##D # first, load and pre-process a corpus from 3 text files:
##D dataset = load.corpus.and.parse(files = c("1.txt", "2.txt", "3.txt"))
##D #       
##D # then, return 100 the most frequent words of the entire corpus:
##D make.frequency.list(dataset, head = 100)
## End(Not run)



