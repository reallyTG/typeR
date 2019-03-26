library(chinese.misc)


### Name: create_ttm
### Title: Create Term-Term Matrix (Term-Cooccurrence Matrix)
### Aliases: create_ttm

### ** Examples

x <- c(
  "Hello, what do you want to drink?", 
  "drink a bottle of milk", 
  "drink a cup of coffee", 
  "drink some water")
dtm <- corp_or_dtm(x, from = "v", type = "dtm")
ttm1 <- create_ttm(dtm)
ttm2 <- create_ttm(dtm, tomatrix = TRUE)
tdm <- t(dtm)
ttm3 <- create_ttm(tdm)
ttm_sparse <- ttm3[[1]]
ttm_ordinary <- as.matrix(ttm_sparse)
colnames(ttm_ordinary) <- ttm3[[2]]
rownames(ttm_ordinary) <- ttm3[[2]]
# You can also use Matrix::writeMM(ttm_sparse, filename) 
# to write it on your disk.



