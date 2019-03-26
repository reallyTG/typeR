library(SemNetCleaner)


### Name: autoDestr
### Title: Automated De-string of Responses
### Aliases: autoDestr

### ** Examples

#create example stringed responses
stringed <- cbind(rowSums(cbind(rmat[,c(1,2)])),convmat)
#change name to stringed name
colnames(stringed)[1] <- "alligator.ant"

## No test: 
#text cleaned
clean <- textcleaner(rmat)

#automated de-string
convmat <- autoDestr(clean, 10)
## End(No test)




