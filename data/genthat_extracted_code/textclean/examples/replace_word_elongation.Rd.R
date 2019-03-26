library(textclean)


### Name: replace_word_elongation
### Title: Replace Word Elongations
### Aliases: replace_word_elongation

### ** Examples

x <- c('look', 'noooooo!', 'real coooool!', "it's sooo goooood", 'fsdfds', 
    'fdddf', 'as', "aaaahahahahaha", "aabbccxccbbaa", 'I said heyyy!',
    "I'm liiiike whyyyyy me?", "Wwwhhatttt!", NA)

replace_word_elongation(x)
replace_word_elongation(x, impart.meaning = TRUE)



