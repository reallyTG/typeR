library(handyplots)


### Name: wordcount
### Title: Word Count
### Aliases: wordcount

### ** Examples

myfile <- file.path(tempdir(), "wordcounttest.txt")
write("Four four four four. Three three three. Two two. One.",file=myfile )
wordcount(myfile ,4)

##or text can be entered inline
wordcount(text="Four four four four. Three three three. Two two. One.",n=4)



