library(tm)


### Name: readTagged
### Title: Read In a POS-Tagged Word Text Document
### Aliases: readTagged

### ** Examples

# See http://www.nltk.org/book/ch05.html or file ca01 in the Brown corpus
x <- paste("The/at grand/jj jury/nn commented/vbd on/in a/at number/nn of/in",
           "other/ap topics/nns ,/, among/in them/ppo the/at Atlanta/np and/cc",
           "Fulton/np-tl County/nn-tl purchasing/vbg departments/nns which/wdt",
           "it/pps said/vbd ``/`` are/ber well/ql operated/vbn and/cc follow/vb",
           "generally/rb accepted/vbn practices/nns which/wdt inure/vb to/in the/at",
           "best/jjt interest/nn of/in both/abx governments/nns ''/'' ./.")
vs <- VectorSource(x)
elem <- getElem(stepNext(vs))
(doc <- readTagged()(elem, language = "en", id = "id1"))
tagged_words(doc)



