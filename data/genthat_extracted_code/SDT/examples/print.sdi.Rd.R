library(SDT)


### Name: print.sdi
### Title: Print Method for Objects of Class sdi
### Aliases: print.sdi
### Keywords: methods print

### ** Examples

## attach dataset to search path (to use variable names)
attach(learning_motivation)

## adjusted index print
padj <- print(sdi(intrinsic, identified, introjected, external))
## compactly displayed structure of the object padj
str(padj)

## original index print
sdi(intrinsic, identified, introjected, external, compute.adjusted = FALSE)



