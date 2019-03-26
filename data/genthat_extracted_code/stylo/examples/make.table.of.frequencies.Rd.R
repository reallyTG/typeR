library(stylo)


### Name: make.table.of.frequencies
### Title: Prepare a table of (relative) word frequencies
### Aliases: make.table.of.frequencies

### ** Examples

# to get frequencies of the words "a", "the" and "of" from a text:

sample.txt = txt.to.words("My father had a small estate 
             in Nottinghamshire: I was the third of five sons.")
make.table.of.frequencies(sample.txt, c("a", "the", "of"))



# to get a table of frequencies across several texts:

txt.1 = "Gallia est omnis divisa in partes tres, quarum unam incolunt 
    Belgae, aliam Aquitani, tertiam qui ipsorum lingua Celtae, nostra 
    Galli appellantur."
txt.2 = "Si quis antea, iudices, mirabatur quid esset quod, pro tantis 
    opibus rei publicae tantaque dignitate imperi, nequaquam satis multi 
    cives forti et magno animo invenirentur qui auderent se et salutem 
    suam in discrimen offerre pro statu civitatis et pro communi 
    libertate, ex hoc tempore miretur potius si quem bonum et fortem 
    civem viderit, quam si quem aut timidum aut sibi potius quam rei 
    publicae consulentem."
txt.3 = "Nam mores et instituta vitae resque domesticas ac familiaris 
    nos profecto et melius tuemur et lautius, rem vero publicam nostri 
    maiores certe melioribus temperaverunt et institutis et legibus."
my.corpus.raw = list(txt.1, txt.2, txt.3)
my.corpus.clean = lapply(my.corpus.raw, txt.to.words)
my.favorite.words = c("et", "in", "se", "rara", "avis")
make.table.of.frequencies(my.corpus.clean, my.favorite.words)


# to include all words in the reference list, no matter if they 
# occurred in the corpus:
make.table.of.frequencies(my.corpus.clean, my.favorite.words,
    absent.sensitive=FALSE)


# to prepare a table of frequencies of all the words represented in 
# a corpus, in descendent occurence order, one needs to make the frequency
# list first, via the function 'make.frequency.list'
complete.word.list = make.frequency.list(my.corpus.clean)
make.table.of.frequencies(my.corpus.clean, complete.word.list)


# to create a table of frequencies of word pairs (word 2-grams):
my.word.pairs = lapply(my.corpus.clean, txt.to.features, ngram.size=2)
make.table.of.frequencies(my.word.pairs, c("et legibus", "hoc tempore"))



