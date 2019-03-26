library(tailloss)


### Name: compressELT
### Title: Compress the event loss table
### Aliases: compressELT

### ** Examples

data(UShurricane)

# Compress the table to thousands of dollars

USh.k <- compressELT(ELT(UShurricane), digits = -3)
summary(USh.k)

# Compress the table to millions of dollars

USh.m <- compressELT(ELT(UShurricane), digits = -6)
summary(USh.m)



