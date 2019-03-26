library(SemNetCleaner)


### Name: destr
### Title: De-string Responses
### Aliases: destr

### ** Examples

#create example stringed responses
stringed <- cbind(rowSums(cbind(rmat[,c(1,2)])),convmat)

#change name to stringed name
colnames(stringed)[1] <- "alligator.ant"

#de-string
convmat <- destr(stringed, 1, ".")




