library(RcmdrMisc)


### Name: rcorr.adjust
### Title: Compute Pearson or Spearman Correlations with p-Values
### Aliases: rcorr.adjust print.rcorr.adjust
### Keywords: htest

### ** Examples

if (require(car)){
    data(Mroz)
    print(rcorr.adjust(Mroz[,c("k5", "k618", "age", "lwg", "inc")]))
    print(rcorr.adjust(Mroz[,c("k5", "k618", "age", "lwg", "inc")], type="spearman"))
    }



