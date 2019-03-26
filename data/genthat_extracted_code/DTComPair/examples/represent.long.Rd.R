library(DTComPair)


### Name: represent.long
### Title: Long Representation of Results from Two Binary Diagnostic Tests
### Aliases: represent.long

### ** Examples

data(Paired1) # Hypothetical study data
names(Paired1)
new.long <- represent.long(d=Paired1$d, y1=Paired1$y1, y2=Paired1$y2)
str(new.long)
head(new.long)



