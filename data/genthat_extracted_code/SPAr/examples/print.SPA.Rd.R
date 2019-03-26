library(SPAr)


### Name: print.SPA
### Title: Print out the values and significance of SPA test scores.
### Aliases: print.SPA

### ** Examples

data(SPA_example)
attach(SPA_example)
I1_dich <- SPA.I(x,y.d,interaction=1,nperm=100) # only compute I1 and its pvalue
print(I1_dich)



