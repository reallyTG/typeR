library(ndl)


### Name: orthoCoding
### Title: Code a character string (written word form) as letter n-grams
### Aliases: orthoCoding
### Keywords: discriminative learning

### ** Examples


#Default
orthoCoding(tokenize=FALSE)
#With tokenizing on a specific character
orthoCoding(tokenize=TRUE)

#Comparing different n-gram sizes
data(serbian) 
serbian$Cues=orthoCoding(serbian$WordForm, grams=2)
head(serbian$Cues)
serbian$Cues=orthoCoding(serbian$WordForm, grams=c(2,4))
head(serbian$Cues)



