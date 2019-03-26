library(whitening)


### Name: lusc
### Title: TCGA LUSC Data
### Aliases: lusc
### Keywords: datasets

### ** Examples

# load whitening library
library("whitening")

# load TGCA LUSC data set
data(lusc)

names(lusc)
#"rnaseq2"         "methyl"          "sex"             "packs"          
#"survivalTime"    "censoringStatus" 

dim(lusc$rnaseq2) # 130 206 gene expression
dim(lusc$methyl)  # 130 234 methylation level

## Not run: 
##D library("survival")
##D s = Surv(lusc$survivalTime, lusc$censoringStatus)
##D plot(survfit(s ~ lusc$sex), xlab = "Years", ylab = "Probability of survival", lty=c(2,1), lwd=2)
##D legend("topright", legend = c("male", "female"), lty =c(1,2), lwd=2)
## End(Not run)




