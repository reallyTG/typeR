library(FRK)


### Name: data.frame<-
### Title: Basis-function data frame object
### Aliases: data.frame<- $,Basis-method $<-,Basis-method
###   data.frame<-,Basis-method data.frame_Basis,Basis-method
###   data.frame<-,TensorP_Basis-method data.frame_Basis,Basis-method
###   as.data.frame.Basis as.data.frame.TensorP_Basis

### ** Examples

G <- local_basis()
df <- data.frame(G)
print(df$res)
df$res <- 2
data.frame(G) <- df



