library(DTComPair)


### Name: tab.paired
### Title: Tabulate Results from Two Binary Diagnostic Tests in a Paired
###   Study Design
### Aliases: tab.paired

### ** Examples

data(Paired1) # Hypothetical study data 
b <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
str(b)
b$diseased
b$non.diseased
print(b)



