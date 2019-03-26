library(SKAT)


### Name: SKATBinary_Single
### Title: Single variant tests for binary traits with Firth and efficient
###   resampling methods
### Aliases: SKATBinary_Single

### ** Examples



data(SKATBinary.example)
attach(SKATBinary.example)


obj<-SKAT_Null_Model(y ~ x1 + x2, out_type="D")
out = SKATBinary_Single(Z[,1], obj)

# p-value
out$p.value

# MAP
out$MAP

# method used to compute p-value (method.bin)
out$method.bin


#
#	Use firth method to compute p-value
SKATBinary_Single(Z[,1], obj, method.bin="Firth")$p.value




