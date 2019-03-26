library(DTComPair)


### Name: acc.1test
### Title: Accuracy of a Single Binary Diagnostic Test
### Aliases: acc.1test

### ** Examples

data(Paired1) # Hypothetical study data 
a1 <- tab.1test(d=d, y=y1, data=Paired1)
a2 <- acc.1test(a1)
print(a2)



