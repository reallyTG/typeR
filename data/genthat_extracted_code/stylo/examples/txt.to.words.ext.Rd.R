library(stylo)


### Name: txt.to.words.ext
### Title: Split text into words: extended version
### Aliases: txt.to.words.ext

### ** Examples

txt.to.words.ext("Nel mezzo del cammin di nostra vita / mi ritrovai per 
    una selva oscura, che la diritta via era smarrita.")

# to see the difference between particular options for English,
# consider the following sentence from Joseph Conrad's "Nostromo":
sample.text = "That's how your money-making is justified here."
txt.to.words.ext(sample.text, language = "English")
txt.to.words.ext(sample.text, language = "English.contr")
txt.to.words.ext(sample.text, language = "English.all")



