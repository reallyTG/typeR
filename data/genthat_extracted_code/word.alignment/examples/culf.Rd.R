library(word.alignment)


### Name: culf
### Title: Make a String's First n Characters Lowercase
### Aliases: culf

### ** Examples

# x is a list

x=list('W-A for an English-Persian Parallel Corpus (Mizan).','ALIGNMENT is a link between words.')

culf(x, n=8) ## culf(x, n=8) is not a list

y='MT is the automatic translation. SMT is one of the methods of MT.'

culf(y) # only run for the first sentence

u1=unlist(strsplit(y, ". ", fixed = TRUE))
sapply(1:length(u1),function(x)culf(u1[x])) ## run for all sentences

h = 'It is a METHOD for this function.'
culf (h, second = TRUE) #only run for the first word

h1 = strsplit(h, ' ')[[1]]
culf(h1, second = TRUE) # run for all words



