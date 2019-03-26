library(SPAr)


### Name: SPA.I
### Title: Compute rare variants association test scores with and(or)
###   without gene-gene interactions
### Aliases: SPA.I

### ** Examples

data(SPA_example)
attach(SPA_example)

## compute p-values of dichotomous traits

pstar_dich <- SPA.I(x,y.d,nperm=10) #compute I1,I2 and p* and their p-values
print(pstar_dich)

I1_dich <- SPA.I(x,y.d,interaction=1,nperm=10) # only compute I1 and its pvalue
print(I1_dich)


## compute p-values of continuous traits

pstar_cont <- SPA.I(x,y.c,nperm=10,type="cont")  #compute I1,I2 and p* and their p-values
print(pstar_cont)

I1_cont <- SPA.I(x,y.c,type="cont",interaction=1,nperm=10) # only compute I1 and its pvalue
print(I1_cont)



