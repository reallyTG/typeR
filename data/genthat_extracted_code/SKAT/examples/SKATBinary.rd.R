library(SKAT)


### Name: SKATBinary
### Title: SNP set test for binary traits with asymptotic and efficient
###   resampling methods
### Aliases: SKATBinary SKATBinary.SSD.OneSet
###   SKATBinary.SSD.OneSet_SetIndex

### ** Examples



data(SKATBinary.example)
attach(SKATBinary.example)


obj<-SKAT_Null_Model(y ~ x1 + x2, out_type="D")

# run SKAT (default method) with Hybrid
out = SKATBinary(Z, obj)

# p-value
out$p.value

# MAP
out$MAP

# method used to compute p-value (method.bin)
out$method.bin


#
#	Run burden and SKAT-O with Hybrid

SKATBinary(Z, obj, method="Burden")$p.value
SKATBinary(Z, obj, method="SKATO")$p.value

#
#	Run with SKAT-QA, -MA and -UA

SKATBinary(Z, obj, method.bin="QA")$p.value

SKATBinary(Z, obj, method.bin="MA")$p.value

SKATBinary(Z, obj, method.bin="UA")$p.value

# UA from SKAT function
SKAT(Z, obj)$p.value


#
#	Run with Adaptive ER

out =SKATBinary(Z, obj, method.bin="ER.A")

out$p.value

# the number of total resampling is smaller than 2*10^6 (default value)
out$n.total 




