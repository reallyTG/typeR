library(charlatan)


### Name: LoremProvider
### Title: LoremProvider
### Aliases: LoremProvider lorem_provider_locales
### Keywords: datasets internal

### ** Examples

(x <- LoremProvider$new())
x$locale
x$word()
x$words(3)
x$words(6)
x$sentence()
x$sentences(3)
x$sentences(6)
x$paragraph()
x$paragraphs(3)
x$paragraphs(6)
cat(x$paragraphs(6), sep = "\n")
x$text(10)
x$text(25)
x$text(50)
x$text(300)
x$text(2000)

# set a different sentence_punctuation or word_connector
(x <- LoremProvider$new(sentence_punctuation = ";"))
x$paragraph(4)
(x <- LoremProvider$new(word_connector = " --- "))
x$paragraph(4)

# different locales
LoremProvider$new(locale = "ar_AA")$word()
LoremProvider$new(locale = "el_GR")$word()
LoremProvider$new(locale = "he_IL")$word()
LoremProvider$new(locale = "ja_JP")$word()
LoremProvider$new(locale = "zh_TW")$word()



