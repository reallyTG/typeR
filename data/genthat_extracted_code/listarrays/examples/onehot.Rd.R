library(listarrays)


### Name: onehot_with_decoder
### Title: Convert vector to a onehot representation (binary class matrix)
### Aliases: onehot_with_decoder onehot decode_onehot onehot_decoder

### ** Examples

if(require(zeallot)) {
  y <- letters[1:4]
  c(Y, decode) %<-% onehot_with_decoder(y)
  Y
  decode(Y)
  identical(y, decode(Y))
  decode(Y[2,,drop = TRUE])
  decode(Y[2,,drop = FALSE])
  decode(Y[2:3,])

  rm(Y, decode)
}

# more peicemeal functions
Y <- onehot(y)
decode_onehot(Y)

# if you need to decode a matrix that lost colnames,
# make your own decoder that remembers classes
my_decode <- onehot_decoder(Y)
colnames(Y) <- NULL
my_decode(Y)
decode_onehot(Y)

# factor and numeric vectors also accepted
onehot(factor(letters[1:4]))
onehot(4:8)




