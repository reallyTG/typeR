library(stylo)


### Name: delete.stop.words
### Title: Exclude stop words (e.g. pronouns, particles, etc.) from a
###   dataset
### Aliases: delete.stop.words

### ** Examples

# (i) excluding stop words from a vector
my.text = c("omnis", "homines", "qui", "sese", "student", "praestare", 
        "ceteris", "animalibus", "summa", "ope", "niti", "decet", "ne",
        "vitam", "silentio", "transeant", "veluti", "pecora", "quae",
        "natura", "prona", "atque", "ventri", "oboedientia", "finxit")
delete.stop.words(my.text, stop.words = c("qui", "quae", "ne", "atque"))


# (ii) excluding stop words from tabular data
#
# assume there is a matrix containing some frequencies
# (be aware that these counts are fictional):
t1 = c(2, 1, 0, 8, 9, 5, 6, 3, 4, 7)
t2 = c(7, 0, 5, 9, 1, 8, 6, 4, 2, 3)
t3 = c(5, 9, 2, 1, 6, 7, 8, 0, 3, 4)
t4 = c(2, 8, 6, 3, 0, 5, 9, 4, 7, 1)
my.data.table = rbind(t1, t2, t3, t4)

# names of the samples:
rownames(my.data.table) = c("text1", "text2", "text3", "text4")
# names of the variables (e.g. words):
colnames(my.data.table) = c("the", "of", "in", "she", "me", "you",
                                    "them", "if", "they", "he")
# the table looks as follows
print(my.data.table)

# now, one might want to get rid of the words "the", "of", "if":
delete.stop.words(my.data.table, stop.words = c("the", "of", "if"))

# also, some pre-defined lists of pronouns can be applied:
delete.stop.words(my.data.table, 
                      stop.words = stylo.pronouns(language = "English"))





