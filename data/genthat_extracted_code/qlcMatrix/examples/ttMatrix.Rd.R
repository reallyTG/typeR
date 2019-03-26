library(qlcMatrix)


### Name: ttMatrix
### Title: Construct a 'type-token' (tt) Matrix from a vector
### Aliases: ttMatrix

### ** Examples

# Consider two nominal variables
# one with eight categories, and one with three categories
var1 <- sample(8, 1000, TRUE)
var2 <- sample(3, 1000, TRUE)

# turn them into type-token matrices
M1 <- ttMatrix(var1, simplify = TRUE)
M2 <- ttMatrix(var2, simplify = TRUE)


# Then taking  the `residuals' from assocSparse ...
x <- as.matrix(assocSparse(t(M1), t(M2), method = res))

# ... is the same as the residuals as given by a chi-square
x2 <- chisq.test(var1, var2)$residuals
class(x2) <- "matrix"
all.equal(x, x2, check.attributes = FALSE) # TRUE

# A second quick example: consider a small piece of English text:
text <- "Once upon a time in midwinter, when the snowflakes were 
falling like feathers from heaven, a queen sat sewing at her window, 
which had a frame of black ebony wood. As she sewed she looked up at the snow 
and pricked her finger with her needle. Three drops of blood fell into the snow. 
The red on the white looked so beautiful that she thought to herself: 
If only I had a child as white as snow, as red as blood, and as black 
as the wood in this frame. Soon afterward she had a little daughter who was 
as white as snow, as red as blood, and as black as ebony wood, and therefore 
they called her Little Snow-White. And as soon as the child was born, 
the queen died." 

# split by characters, make lower-case, and turn into a type-token matrix
split.text <- tolower(strsplit(text,"")[[1]])
M <- ttMatrix(split.text, simplify = TRUE)

# rowSums give the character frequency
freq <- rowSums(M)
names(freq) <- rownames(M)
sort(freq, decreasing = TRUE)

# shift the matrix one character to the right using a bandSparse matrix
S <- bandSparse(n = ncol(M), k = 1)
N <- M %*% S

# use rKhatriRao on M and N to get frequencies of bigrams
B <- rKhatriRao(M, N, binder = "")
freqB <- rowSums(B$M)
names(freqB) <- B$rownames
sort(freqB, decreasing = TRUE)

# then the association between N and M is related 
# to the transition probabilities between the characters. 
P <- assocSparse(t(M), t(N))
plot(hclust(as.dist(-P), method = "ward"))



