library(BIOdry)


### Name: lmeForm
### Title: LME formula
### Aliases: lmeForm

### ** Examples

##Multilevel ecological data series of tree-ring widths:
data(Prings05,envir = environment())

## LME formula:
form1 <- lmeForm(Prings05,prim.cov = FALSE)
print(form1)
## removing the sample level from the formula
form2 <- lmeForm(Prings05,lev.rm = 'sample')
form2 <- lmeForm(Prings05,lev.rm = 1)

## groupedData object with the LME formula 
gdata <- groupedData(lmeForm(Prings05,lev.rm = 1),
                     data = Prings05)
plot(gdata,groups = ~ sample)



