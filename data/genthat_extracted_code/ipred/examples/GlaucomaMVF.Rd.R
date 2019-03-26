library(ipred)


### Name: GlaucomaMVF
### Title: Glaucoma Database
### Aliases: GlaucomaMVF
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data("GlaucomaMVF", package = "ipred")
##D library("rpart")
##D 
##D response <- function (data) {
##D   attach(data)
##D   res <- ifelse((!is.na(clv) & !is.na(lora) & clv >= 5.1 & lora >= 
##D         49.23372) | (!is.na(clv) & !is.na(lora) & !is.na(cs) & 
##D         clv < 5.1 & lora >= 58.55409 & cs < 1.405) | (is.na(clv) & 
##D         !is.na(lora) & !is.na(cs) & lora >= 58.55409 & cs < 1.405) | 
##D         (!is.na(clv) & is.na(lora) & cs < 1.405), 0, 1)
##D   detach(data)
##D   factor (res, labels = c("glaucoma", "normal"))
##D }
##D 
##D errorest(Class~clv+lora+cs~., data = GlaucomaMVF, model=inclass, 
##D        estimator="cv", pFUN = list(list(model = rpart)), cFUN = response)
## End(Not run)



