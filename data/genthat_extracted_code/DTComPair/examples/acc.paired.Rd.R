library(DTComPair)


### Name: acc.paired
### Title: Accuracy of Two Binary Diagnostic Tests in a Paired Study Design
### Aliases: acc.paired

### ** Examples

data(Paired1) # Hypothetical study data 
b1 <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
b2 <- acc.paired(b1)
print(b2)



